Proceso GestorDeContrasenas
    Definir usuarios, contrasenas Como Cadena
    Definir n, i Como Entero
    Definir fuertes, debiles Como Entero
    Definir es_fuerte Como Logico
    
    Escribir "=== GESTOR DE CONTRASEÑAS SEGURAS ==="
    Escribir "¿Cuántos usuarios desea registrar?"
    Leer n
    
    Dimension usuarios[n]
    Dimension contrasenas[n]
    
    Para i <- 1 Hasta n Con Paso 1 Hacer
        RegistrarUsuario(usuarios, contrasenas, i)
    FinPara
    
    fuertes <- 0
    debiles <- 0
    
    Para i <- 1 Hasta n Con Paso 1 Hacer
        es_fuerte <- VerificarContrasena(contrasenas[i])
        Si es_fuerte Entonces
            fuertes <- fuertes + 1
        Sino
            debiles <- debiles + 1
        FinSi
    FinPara
    
    GenerarAlertas(usuarios, contrasenas, n, fuertes, debiles)
FinProceso

SubProceso RegistrarUsuario(usuarios Por Referencia, contrasenas Por Referencia, i)
    Escribir "Ingrese el nombre del usuario ", i, ":"
    Leer usuarios[i]
    
    Escribir "Ingrese la contraseña de ", usuarios[i], ":"
    Leer contrasenas[i]
FinSubProceso

Funcion es_fuerte <- VerificarContrasena(pass)
    Definir es_fuerte Como Logico
    
    Si Longitud(pass) >= 8 Entonces
        es_fuerte <- Verdadero
    Sino
        es_fuerte <- Falso
    FinSi
FinFuncion

SubProceso GenerarAlertas(usuarios, contrasenas, n, fuertes, debiles)
    Definir i Como Entero
    
    Escribir ""
    Escribir "=== REPORTE DE SEGURIDAD ==="
    Escribir "Contraseñas fuertes: ", fuertes
    Escribir "Contraseñas débiles: ", debiles
    Escribir ""
    
    Para i <- 1 Hasta n Con Paso 1 Hacer
        Si Longitud(contrasenas[i]) < 8 Entonces
            Escribir "ALERTA: La contraseña del usuario ", usuarios[i], " es débil."
        FinSi
    FinPara
FinSubProceso