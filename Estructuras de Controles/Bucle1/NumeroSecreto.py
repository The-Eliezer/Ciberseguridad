#Adivina el número secreto (ejemplo: 7).
numero_secreto = 0
while True:
    intento = int(input("Introduce un número: "))
    if intento == numero_secreto:
        print("¡Adivinaste!")
        break
    else:
        print("Intenta de nuevo.")
