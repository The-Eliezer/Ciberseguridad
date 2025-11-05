#Pide 10 números y calcula la suma total.
suma = 0
contador = 1
while contador <= 10:
    numero = int(input("Introduce el número {}: ".format(contador)))
    suma += numero
    contador += 1
print("La suma total es:", suma)
