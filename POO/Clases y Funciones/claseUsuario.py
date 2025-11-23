# clase **Usuario** con atributos nombre y edad. Con función que muestre los datos del usuario.
class Usuario:  
    def __init__(self, nombre, edad):
        self.nombre = nombre
        self.edad = edad

    def mostrar_datos(self):
        print(f"Nombre: {self.nombre}, Edad: {self.edad}")      
# Ejemplo de uso
usuario1 = Usuario("Juan", 30)
usuario1.mostrar_datos()

