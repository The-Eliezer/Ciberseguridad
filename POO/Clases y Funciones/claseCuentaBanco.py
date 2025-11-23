#Crea una clase llamada **CuentaBancaria** con atributos titular y balance. Implementa funciones para depositar y retirar.
class CuentaBancaria:
    def __init__(self, titular, balance=0):
        self.titular = titular
        self.balance = balance

    def depositar(self, cantidad):
        if cantidad > 0:
            self.balance += cantidad
            print(f"Depósito de {cantidad} realizado. Nuevo balance: {self.balance}")
        else:
            print("La cantidad a depositar debe ser positiva.")

    def retirar(self, cantidad):
        if 0 < cantidad <= self.balance:
            self.balance -= cantidad
            print(f"Retiro de {cantidad} realizado. Nuevo balance: {self.balance}")
        else:
            print("Fondos insuficientes o cantidad inválida.")

# Ejemplo de uso
if __name__ == "__main__":
    cuenta = CuentaBancaria("Juan Pérez", 1000)
    cuenta.depositar(500)
    cuenta.retirar(200)
    cuenta.retirar(2000)
    cuenta.depositar(-100)

    