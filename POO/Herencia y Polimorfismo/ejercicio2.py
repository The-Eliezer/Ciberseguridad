#EJERCICIO USANDO HERENCIA Y POLIMORFISMO
#Crea una clase base Empleado con atributos nombre y salario. Crea clases hijas como Gerente y Técnico, cada una con un método calcular_bono() diferente
class Empleado:
    def __init__(self, nombre: str, salario: float):
        self.nombre = nombre
        self.salario = salario

    def calcular_bono(self) -> float:
        raise NotImplementedError("Subclase debe implementar el método calcular_bono")
    
class Gerente(Empleado):
    def calcular_bono(self) -> float:
        return self.salario * 0.20  # 20% de bono para gerentes
    
class Tecnico(Empleado):
    def calcular_bono(self) -> float:
        return self.salario * 0.10  # 10% de bono para técnicos
# Ejemplo de uso
if __name__ == "__main__":
    empleados = [Gerente("Ana", 80000), Tecnico("Luis", 50000)]
    for empleado in empleados:
        print(f"{empleado.nombre} tiene un bono de: {empleado.calcular_bono()}")

        