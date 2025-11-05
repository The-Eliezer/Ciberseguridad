#Muestra la tabla de multiplicar de un número ingresado por el usuario.
numero = int(input("Introduce un número para ver su tabla de multiplicar: "))
contador = 1
while contador <= 10:
    print(numero, "x", contador, "=", numero * contador)
    contador += 1
