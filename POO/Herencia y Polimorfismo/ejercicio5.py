#EJERCICIO USANDO HERENCIA Y POLIMORFISMO 
# clase Dispositivo con un método encender(). y clases hijas como Laptop y Teléfono que sobreescriban el comportamiento del método.
class Dispositivo:
    def encender(self):
        raise NotImplementedError("Subclase debe implementar el método encender")


class Laptop(Dispositivo):
    def encender(self):
        return "La laptop está encendida"

class Telefono(Dispositivo):
    def encender(self):
        return "El teléfono está encendido"

# Ejemplo de uso
if __name__ == "__main__":
    dispositivos = [Laptop(), Telefono()]
    for dispositivo in dispositivos:
        print(dispositivo.encender())   

