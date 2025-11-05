#Calcula el factorial de un número.
numero = int(input("Introduce un número para calcular su factorial: "))
factorial = 1
while numero > 0:
    factorial *= numero
    numero -= 1
print("El factorial es:", factorial)
