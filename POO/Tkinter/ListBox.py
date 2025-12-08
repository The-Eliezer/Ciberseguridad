#Ejercicios usando Tkinter
#Crea una ventana con un Listbox que muestre una lista de elementos. Agrega un botón para añadir nuevos elementos a la lista.
import tkinter as tk
from tkinter import simpledialog    
def agregar_elemento():
    nuevo_elemento = simpledialog.askstring("Agregar Elemento", "Ingresa el nuevo elemento:")
    if nuevo_elemento:
        lista_elementos.insert(tk.END, nuevo_elemento)  
# Crear la ventana principal
ventana = tk.Tk()   
ventana.title("Lista de Elementos")
ventana.geometry("300x300")  
# Crear un Listbox para mostrar la lista de elementos   
lista_elementos = tk.Listbox(ventana)
lista_elementos.pack(pady=10, fill=tk.BOTH, expand=True)    
# Crear un Button para agregar nuevos elementos a la lista
boton_agregar = tk.Button(ventana, text="Agregar Elemento", command=agregar_elemento)
boton_agregar.pack(pady=10) 
# Iniciar el bucle principal de la aplicación
ventana.mainloop()
