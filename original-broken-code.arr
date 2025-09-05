# ORIGINAL CODE (BROKEN)
# =====================

largo = 100
ancho = 200

fun five-striped-flags(arriba :: String, medio :: String, medio-2 :: String, medio-3 :: String, abajo :: String) -> Image:
  doc: "Crea una bandera de 5 rayitas."
  frame(above(rectangle(largo, ancho / 3, "solid", arriba),
      above(rectangle(largo, ancho / 3, "solid", medio),
        rectangle(largo, ancho / 3, "solid", medio-2)
        (above(rectangle(largo, ancho / 3, "solid", medio-3)
            (above(rectangle(largo, ancho / 3, "solid",abajo))))))))
end

# PROBLEMS WITH ORIGINAL CODE:
# 1. Missing "include image"
# 2. Line 9: rectangle(...) (above(...)) - invalid syntax
# 3. Line 10-11: (above(...) (above(...))) - wrong parentheses nesting  
# 4. Missing comma between arguments in nested structure
# 5. Using ancho/3 for 5 stripes (creates 333px total height instead of 200px)