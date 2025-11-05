#Pide 5 notas, calcula la suma y el promedio final.
suma_notas = 0
contador = 1
while contador <= 5:
    nota = float(input("Introduce la nota {}: ".format(contador)))
    suma_notas += nota
    contador += 1
promedio = suma_notas / 5
print("La suma de las notas es:", suma_notas)
print("El promedio es:", promedio)
