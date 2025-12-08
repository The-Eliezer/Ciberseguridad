#Ejercicios usando Tkinter
#Diseña una interfaz con un Canvas donde el usuario pueda dibujar líneas manteniendo presionado el botón del mouse.
import tkinter as tk
def iniciar_dibujo(event):
    global ultimo_x, ultimo_y
    ultimo_x, ultimo_y = event.x, event.y   
def dibujar(event):
    global ultimo_x, ultimo_y
    canvas.create_line(ultimo_x, ultimo_y, event.x, event.y, fill="black", width=2)
    ultimo_x, ultimo_y = event.x, event.y
# Crear la ventana principal
ventana = tk.Tk()   
ventana.title("Dibujo en Canvas")
ventana.geometry("400x400") 
# Crear un Canvas para dibujar
canvas = tk.Canvas(ventana, bg="white") 
canvas.pack(fill=tk.BOTH, expand=True)  
# Vincular los eventos del mouse al Canvas
canvas.bind("<Button-1>", iniciar_dibujo)
canvas.bind("<B1-Motion>", dibujar) 
# Iniciar el bucle principal de la aplicación
ventana.mainloop()
