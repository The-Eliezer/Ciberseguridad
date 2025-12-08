#EJERCICIO USANDO HERENCIA Y POLIMORFISMO 
# clase Vehiculo con un método mover(). Crea clases hijas como Carro y Bicicleta que implementen su propia versión del método
class Vehiculo:
    def mover(self):
        raise NotImplementedError("Subclase debe implementar el método mover")
    
class Carro(Vehiculo):
    def mover(self):
        return "El carro está en movimiento"

class Bicicleta(Vehiculo):
    def mover(self):
        return "La bicicleta está en movimiento"
# Ejemplo de uso
if __name__ == "__main__":
    vehiculos = [Carro(), Bicicleta()]
    for vehiculo in vehiculos:
        print(vehiculo.mover()) 

