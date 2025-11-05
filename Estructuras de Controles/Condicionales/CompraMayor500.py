#Ingresa el monto de una compra. Si es mayor a 500 aplica un 10% de descuento, sino paga precio normal.
monto = float(input("Introduce el monto de la compra: "))
if monto > 500:
    descuento = monto * 0.10
    print("Se aplica un descuento de:", descuento)
    print("Total a pagar:", monto - descuento)
else:
    print("Total a pagar:", monto)
