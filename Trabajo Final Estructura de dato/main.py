import time
import os
import socket
import uuid
from scapy.all import ARP, Ether, srp, conf
from rich.console import Console, Group # <--- IMPORTANTE: Agregado Group
from rich.table import Table
from rich.live import Live
from rich.panel import Panel
from rich.text import Text

# Configuración para que Scapy no imprima basura en consola
conf.verb = 0 

class AccessController:
    def __init__(self, limite_conexiones=1, archivo_permitidos="permitidos.txt"):
        self.dispositivos_registrados = [] 
        self.matriz_conexiones = []
        self.limite_conexiones = limite_conexiones
        self.alertas = []
        self.archivo_permitidos = archivo_permitidos

        # Cargamos archivo y obtenemos datos propios al iniciar
        self.cargar_desde_archivo()
        self.mi_mac, self.mi_ip = self.obtener_datos_propios()

    def obtener_datos_propios(self):
        """Obtiene la IP y MAC real de ESTA máquina"""
        try:
            s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
            s.connect(("8.8.8.8", 80))
            mi_ip = s.getsockname()[0]
            s.close()
            
            mac_num = uuid.getnode()
            mi_mac = '-'.join(['{:02x}'.format((mac_num >> elements) & 0xff) for elements in range(0,2*6,2)][::-1]).upper()
            return mi_mac, mi_ip
        except Exception:
            return "00-00-00-00-00-00", "127.0.0.1"

    def cargar_desde_archivo(self):
        """Lee el archivo permitidos.txt y limpia las MACs"""
        if not os.path.exists(self.archivo_permitidos):
            # Crea el archivo si no existe
            with open(self.archivo_permitidos, "w") as f:
                f.write("AA-BB-CC-DD-EE-FF, EjemploUsuario\n")
            return

        try:
            with open(self.archivo_permitidos, "r", encoding="utf-8") as f:
                for linea in f:
                    linea = linea.strip()
                    if not linea or linea.startswith("#"): continue

                    if "," in linea:
                        datos = linea.split(",")
                        mac_sucia = datos[0]
                        usuario = datos[1]
                        
                        # LIMPIEZA TOTAL DE LA MAC (Quita : - . y espacios)
                        mac_limpia = "".join(c for c in mac_sucia if c.isalnum()).upper()
                        
                        if len(mac_limpia) == 12:
                            self.registrar_dispositivo(mac_limpia, usuario.strip())
        except Exception as e:
            print(f"[Error] Leyendo archivo: {e}")

    def registrar_dispositivo(self, mac, usuario):
        nuevo_dispositivo = {'mac': mac, 'usuario': usuario}
        self.dispositivos_registrados.append(nuevo_dispositivo)

    def validar_acceso(self, dispositivos_encontrados):
        self.matriz_conexiones = [] 
        
        # Diccionario temporal para contar conexiones por usuario
        temp_conteo = {}
        lista_procesada = []
        
        # 1. Identificar usuarios
        for disp in dispositivos_encontrados:
            # Limpiamos la MAC encontrada para comparar
            mac_limpia = disp['mac'].replace(":", "").replace("-", "").upper()
            
            usuario_encontrado = "DESCONOCIDO"
            es_autorizado = False
            
            for registro in self.dispositivos_registrados:
                if registro['mac'] == mac_limpia:
                    usuario_encontrado = registro['usuario']
                    es_autorizado = True
                    break
            
            if es_autorizado:
                temp_conteo[usuario_encontrado] = temp_conteo.get(usuario_encontrado, 0) + 1
            
            lista_procesada.append({
                'usuario': usuario_encontrado,
                'ip': disp['ip'],
                'mac_visual': disp['mac'], # Guardamos la MAC con formato bonito para verla
                'autorizado': es_autorizado
            })

        # 2. Generar Matriz Final y Alertas
        for item in lista_procesada:
            usr = item['usuario']
            estado = "[green]OK[/]"
            
            if not item['autorizado']:
                estado = "[bold red]INTRUSO[/]"
                self.generar_alerta("NO AUTORIZADO", f"MAC: {item['mac_visual']} en IP {item['ip']}")
            else:
                cantidad = temp_conteo.get(usr, 0)
                if cantidad > self.limite_conexiones:
                    estado = f"[bold orange1]LIMITE EXC. ({cantidad})[/]"
                    self.generar_alerta("LIMITE EXCEDIDO", f"{usr} tiene {cantidad} equipos.")

            fila = [usr, item['ip'], item['mac_visual'], estado]
            self.matriz_conexiones.append(fila)

    def generar_alerta(self, tipo, detalle):
        timestamp = time.strftime("%H:%M:%S")
        mensaje = f"[{timestamp}] {tipo}: {detalle}"
        if not self.alertas or self.alertas[-1] != mensaje:
            self.alertas.append(mensaje)
            if len(self.alertas) > 8: 
                self.alertas.pop(0)

    def escanear_red(self, rango_ip):
        try:
            arp = ARP(pdst=rango_ip)
            ether = Ether(dst="ff:ff:ff:ff:ff:ff")
            resultado = srp(ether/arp, timeout=2, verbose=0)[0]
        except:
            resultado = []
        
        dispositivos = []
        for sent, received in resultado:
            mac_fmt = received.hwsrc.replace(":", "-").upper()
            dispositivos.append({'ip': received.psrc, 'mac': mac_fmt})
        
        # Agregar mi propia PC si no apareció
        ya_esta = False
        for d in dispositivos:
            if d['ip'] == self.mi_ip:
                ya_esta = True; break
        if not ya_esta:
            dispositivos.append({'ip': self.mi_ip, 'mac': self.mi_mac})
            
        return dispositivos

def main():
    console = Console()
    
    # --- CONFIGURACIÓN ---
    RANGO_RED = "192.168.1.0/24"  # <--- VERIFICA QUE ESTE SEA TU RANGO
    controlador = AccessController(limite_conexiones=1) 

    console.print(f"[bold yellow]Iniciando Monitor en {RANGO_RED}...[/]")

    with Live(console=console, refresh_per_second=1) as live:
        while True:
            try:
                # 1. Escanear y Procesar
                dispositivos = controlador.escanear_red(RANGO_RED)
                controlador.validar_acceso(dispositivos)

                # 2. Crear la Tabla
                table = Table(title=f"Monitor WiFi (Activos: {len(dispositivos)})")
                table.add_column("Usuario", style="cyan")
                table.add_column("IP", style="green")
                table.add_column("MAC", style="magenta")
                table.add_column("Estado", justify="center")

                for fila in controlador.matriz_conexiones:
                    table.add_row(*fila)

                # 3. Crear el Panel de Alertas
                texto_alertas = "\n".join(controlador.alertas)
                if not texto_alertas:
                    texto_alertas = "Sin alertas recientes."
                
                panel_alertas = Panel(texto_alertas, title="[bold red]ALERTAS DE SEGURIDAD[/]", border_style="red")

                # 4. AGRUPAR TODO (SOLUCIÓN AL ERROR VISUAL)
                # Usamos Group para renderizar la tabla ARRIBA y las alertas ABAJO
                pantalla_completa = Group(
                    table,
                    Text("\n"), # Un espacio vacío
                    panel_alertas
                )
                
                live.update(pantalla_completa)
                
                time.sleep(3)
                
            except KeyboardInterrupt:
                break
            except Exception as e:
                console.print(f"[red]Error crítico: {e}[/red]")
                break

if __name__ == "__main__":
    main()