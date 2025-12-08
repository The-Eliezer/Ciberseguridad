#Ejercicios usando Tkinter
#ventana básica con Tkinter que muestre un mensaje de bienvenida usando un Label.
import tkinter as tk
from tkinter import messagebox  
def mostrar_bienvenida():
    messagebox.showinfo("Bienvenida", "¡Bienvenido a la aplicación Tkinter!")
# Crear la ventana principal
ventana = tk.Tk()   
ventana.title("Ventana de Bienvenida")
ventana.geometry("300x150") 
# Crear un botón para mostrar el mensaje de bienvenida  
boton_bienvenida = tk.Button(ventana, text="Mostrar Bienvenida", command=mostrar_bienvenida)
boton_bienvenida.pack(pady=20)  
# Iniciar el bucle principal de la aplicación
ventana.mainloop()
