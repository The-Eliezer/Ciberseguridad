#Ejercicios usando Tkinter
#Crea una interfaz con un Entry y un Button. Al presionar el botón, muestra el texto escrito en el Entry en un Label.
import tkinter as tk
from tkinter import messagebox
def mostrar_texto():
    texto = entrada.get()
    etiqueta.config(text=texto) 
# Crear la ventana principal
ventana = tk.Tk()
ventana.title("Entrada de Texto")
ventana.geometry("300x150")
# Crear un Entry para la entrada de texto
entrada = tk.Entry(ventana) 
entrada.pack(pady=10)
# Crear un Button para mostrar el texto
boton_mostrar = tk.Button(ventana, text="Mostrar Texto", command=mostrar_texto)
boton_mostrar.pack(pady=5)  
# Crear un Label para mostrar el texto
etiqueta = tk.Label(ventana, text="")   
etiqueta.pack(pady=10)
# Iniciar el bucle principal de la aplicación   
ventana.mainloop()
