include image

largo = 100
ancho = 200

fun five-striped-flags(arriba :: String, medio :: String, medio-2 :: String, medio-3 :: String, abajo :: String) -> Image:
  doc: "Crea una bandera de 5 rayitas."
  frame(
    above(rectangle(largo, ancho / 5, "solid", arriba),
      above(rectangle(largo, ancho / 5, "solid", medio),
        above(rectangle(largo, ancho / 5, "solid", medio-2),
          above(rectangle(largo, ancho / 5, "solid", medio-3),
            rectangle(largo, ancho / 5, "solid", abajo))))))
end

# Example usage:
# five-striped-flags("red", "white", "blue", "green", "yellow")