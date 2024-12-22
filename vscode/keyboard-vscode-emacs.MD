# Comandos de movimiento
- C-f = Avanzar caracter
- C-b = Mover hacia atrás caracter
- C-n = Pasar a la siguiente línea
- C-p = Ir a la línea anterior
- C-a = Mover al principio de la línea
- C-e = Mover al final de la línea

- C- <- = Avanzar una unidad de palabra
- M-b = Retroceder una unidad de palabra
- C- -> = Retroceder una unidad de palabra
- M-f = Avanzar una unidad de palabra

- C-v = Desplazarse hacia abajo una unidad de pantalla
- M-v = Desplazarse hacia arriba una unidad de pantalla

- C-⬆️ = Volver al comienzo del párrafo anterior
- C-⬇️ = Avanzar al siguiente párrafo final

- M-< = Mover a la parte superior del buffer
- M-> = Mover a la parte final del buffer

- M-g - M-g = Saltar a la línea (paleta de comandos)

- M-g n = Saltar al siguiente error
- M-g p = Saltar al error anterior

- C-l = Centrar la pantalla en la línea actua

- M-m = Moverse hasta el primer carácter

# Comandos de búsqueda
- C-s = Búsqueda incremental hacia adelante
- C-r = Búsqueda incremental hacia atrás
- C-M-s = Iniciar búsqueda incremental de expresiones regulares
- C-M-r = Iniciar búsqueda incremental de expresiones regulares

- M-% = Reemplazar
- C-M-% = Reemplazar con expresiones regular

- C-M-n = Agregar selección a la siguiente coincidencia encontrada
- C-M-p = Agregar selección a la búsqueda anterior

- M-s o = Abra Búsqueda rápida

# Comandos de edición
- C-d = Borrar derecha
- C-h = Borrar izquierda

- M-\ = Eliminar espacios y tabulaciones alrededor del punto
- C-x C-o = Eliminar líneas en blanco alrededor
- M-^ = Unir dos líneas de forma limpia

- M-d = Palabra asesina
- M-Bksp = Matar palabra izquierda

- C-k = Matar desde el cursor actual hasta el final de la línea
- C-S-Bksp = Matar a toda la línea

- C-w = Matar el texto seleccionado
- M-w = Copiar región para matar el anillo
- C-y = Pegar el último texto que fue cortado

- C-o = línea ABIERTA
- C-j = Nueva linea
- C-m = Nueva linea

- C-x h = Selecionar todo

- C-/ = Deshacer
- C-; = Activar y desactivar comentarios de línea

- M-l = Convertir a minúsculas (lower)
- M-u = Convertir a mayúsculas (upper)
- M-c = Convertir a mayúsculas la primera letra de la palabra

# Comandos de marca
- C-@ = Establezca la marca en el punto y actívela
- C-SPC C-SPC = Coloque la marca empujándola sobre el anillo de marcación, sin activarla.
- C-u C-SPC = Mueva el punto donde estaba la marca y restaure la marca desde el anillo de marcas anteriores.
- C-x C-x = Coloque la marca en el punto y actívela; luego mueva el punto a donde solía estar la marca

# Registros de texto
- C-x r s r = Copiar región en el registro r (copiar a registro)
- C-x r i r = Insertar texto desde el registro r (insertar-registro)

# Otros comandos
- C-g = Cancelar
- C-' = Sugerencia de IntelliSense
- C-x = Abrir paleta de comandos
- C-M-SPC = Activar o desactivar la visibilidad de la barra lateral
- C-x z = Activar o desactivar el modo Zen
- C-x C-c = Cerrar vs code

# Comandos de archivo
- C-x C-f = Apertura rápida de un archivo
- C-x C-s = Guardar
- C-x C-w = Guardar como
- C-x s = Guardar todos los archivos
- C-x C-n = Abrir nuevo vs code

# Comandos de manipulación de pestañas y búfer
- C-x b = Cambiar a otro buffer abierto
- C-x k = Cerrar pestaña actual (buffer)
- C-x 0 = Cerrar editores en el grupo actual

- C-x 1 = Cerrar editores en otro grupo (dividido).
- C-x 2 = Editor dividido horizontalmente
- C-x 3 = Editor dividido verticalmente
- C-x 4 = Cambiar diseño dividido (vertical a horizontal)

- C-x o = Centrar la atención en otro editor dividido
- C-x <- Seleccione la pestaña anterior
- C-x -> Seleccione la siguiente pestaña

# Argumento de prefijo
- C-u = Argumento universal
- M-<number> = Argumento dígito
- M-- = Argumento negativo

# Sexp
- C-M-f = Mover hacia adelante sobre una expresión balanceada
- C-M-b = Mover hacia atrás sobre una expresión balanceada
- C-M-@ = Establecer marca después del final de la siguiente expresión balanceada

- C-M-k = Matar la expresión balanceada hacia adelante
- C-M-Bksp = Matar la expresión balanceada hacia atrás
- C-S-k = Matar una línea como si fuera con kill-line
