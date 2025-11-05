#Pregunta al usuario si tiene internet en casa (1 = Sí, 0 = No) y guarda la respuesta como lógico.
internet = bool(int(input("¿Tienes internet en casa? (1 = Sí, 0 = No): ")))
# Muestra "si" si la respuesta es Sí (True) y "No" si la respuesta es No (False).
print("si" if internet else "No")


