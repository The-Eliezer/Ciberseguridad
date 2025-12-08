#Ejercicios usando Tkinter
#Crea una calculadora sencilla que pueda sumar dos números usando Labels, Entries y Buttons.
import tkinter as tk
from tkinter import messagebox
def sumar_numeros():
    try:
        num1 = float(entrada_num1.get())
        num2 = float(entrada_num2.get())
        resultado = num1 + num2
        etiqueta_resultado.config(text=f"Resultado: {resultado}")
    except ValueError:
        messagebox.showerror("Error", "Por favor, ingresa números válidos.")
# Crear la ventana principal
ventana = tk.Tk()
ventana.title("Calculadora")   
ventana.geometry("300x200")
# Crear Labels y Entries para los números   
etiqueta_num1 = tk.Label(ventana, text="Número 1:")
etiqueta_num1.pack(pady=5)
entrada_num1 = tk.Entry(ventana)
entrada_num1.pack(pady=5)       
etiqueta_num2 = tk.Label(ventana, text="Número 2:")
etiqueta_num2.pack(pady=5)
entrada_num2 = tk.Entry(ventana)
entrada_num2.pack(pady=5)   
# Crear un Button para sumar los números
boton_sumar = tk.Button(ventana, text="Sumar", command=sumar_numeros)
boton_sumar.pack(pady=10)       
# Crear un Label para mostrar el resultado
etiqueta_resultado = tk.Label(ventana, text="Resultado: ")  
etiqueta_resultado.pack(pady=10)
# Iniciar el bucle principal de la aplicación       
ventana.mainloop()
