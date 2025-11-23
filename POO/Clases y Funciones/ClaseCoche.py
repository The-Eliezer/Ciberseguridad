#Crea una clase llamada **Coche** con atributos marca y velocidad. Agrega una función que aumente la velocidad.
class Coche:
    def __init__(self, marca, velocidad=0):
        self.marca = marca
        self.velocidad = velocidad

    def aumentar_velocidad(self, incremento):
        self.velocidad += incremento
        print(f"La velocidad del {self.marca} ahora es {self.velocidad} km/h")

# Ejemplo de uso
if __name__ == "__main__":
    mi_coche = Coche("Toyota")
    mi_coche.aumentar_velocidad(20)
    mi_coche.aumentar_velocidad(30)

    