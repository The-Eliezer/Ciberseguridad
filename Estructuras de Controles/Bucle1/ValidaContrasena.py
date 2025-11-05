#Valida una contraseña. Mientras no sea '1234', vuelve a pedirla.
contrasena = input("Introduce la contraseña: ")
while contrasena != "1234":
    contrasena = input("Contraseña incorrecta. Intenta de nuevo: ")
print("Contraseña correcta.")
