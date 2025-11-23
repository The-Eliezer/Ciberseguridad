class Rectangulo:
    """
    Clase que representa un rectángulo definido por su base y altura.
    """

    def __init__(self, base: float, altura: float):
        if base < 0 or altura < 0:
            raise ValueError("Base y altura deben ser valores no negativos")
        self.base = float(base)
        self.altura = float(altura)

    def area(self) -> float:
        """Calcula y devuelve el área del rectángulo."""
        return self.base * self.altura


if __name__ == "__main__":
    # Ejemplo de uso
    r = Rectangulo(5, 2.5)
    print("Área:", r.area())