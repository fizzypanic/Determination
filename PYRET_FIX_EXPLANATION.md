# Pyret Five-Striped Flags Function - Error Analysis and Fix

## Original Code (with errors):
```pyret
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
```

## Issues Found:

### 1. Missing Image Library Import
**Problem**: Pyret needs to import the image library to use functions like `rectangle`, `above`, and `frame`.
**Fix**: Add `include image` at the top of the file.

### 2. Malformed Function Call Structure
**Problem**: The `above` function calls are nested incorrectly. The structure has misplaced parentheses:
```pyret
rectangle(largo, ancho / 3, "solid", medio-2)
(above(rectangle(largo, ancho / 3, "solid", medio-3)
    (above(rectangle(largo, ancho / 3, "solid",abajo)))))
```

**Fix**: Each `above` call should take exactly 2 arguments and be properly nested:
```pyret
above(rectangle(...),
  above(rectangle(...),
    above(rectangle(...),
      above(rectangle(...),
        rectangle(...)))))
```

### 3. Inconsistent Stripe Sizing
**Problem**: Using `ancho / 3` for 5 stripes creates stripes that are 66.67 pixels high each, totaling 333.33 pixels (more than the intended 200).
**Fix**: Use `ancho / 5` for equal-sized stripes that total the intended height.

## Corrected Code:
```pyret
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
```

## Key Fixes Applied:
1. ✅ Added `include image` import
2. ✅ Fixed nested `above` function calls with proper parentheses
3. ✅ Changed `ancho / 3` to `ancho / 5` for proportional stripes
4. ✅ Removed malformed function call syntax
5. ✅ Added proper indentation for readability

## Alternative Version:
If you intended to keep the original sizing (`ancho / 3`), that version is also provided in the `pyret-flags-fixed.arr` file as `five-striped-flags-original-sizing`.