#clase llamada **Estudiante** con nombre y calificaciones. y función que calcule el promedio.
class Estudiante:
    def __init__(self, nombre, calificaciones):
        self.nombre = nombre
        self.calificaciones = calificaciones

    def calcular_promedio(self):
        if not self.calificaciones:
            return 0
        return sum(self.calificaciones) / len(self.calificaciones)

# Ejemplo de uso
if __name__ == "__main__":
    estudiante = Estudiante("Ana", [85, 90, 78, 92])
    print(f"Promedio de {estudiante.nombre}: {estudiante.calcular_promedio()}")

