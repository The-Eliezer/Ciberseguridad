#EJERCICIO USANDO HERENCIA Y POLIMORFISMO
# clase base Figura con un método area(). Implementa clases hijas como Círculo y Cuadrado que calculen el área según corresponda
import math
class Figura:
    def area(self):
        raise NotImplementedError("Subclase debe implementar el método area")
    
class Circulo(Figura):
    def __init__(self, radio: float):
        self.radio = radio

    def area(self) -> float:
        return math.pi * (self.radio ** 2)
    
class Cuadrado(Figura):
    def __init__(self, lado: float):
        self.lado = lado

    def area(self) -> float:
        return self.lado ** 2
# Ejemplo de uso
if __name__ == "__main__":
    figuras = [Circulo(5), Cuadrado(4)]
    for figura in figuras:
        print(f"Área: {figura.area()}")

