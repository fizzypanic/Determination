include image
provide: *
provide-types: *

# Import the fixed function
include file("five-striped-flags.arr")

# Test cases to demonstrate the function works
check "five-striped-flags function tests":
  # Test with different color combinations
  flag1 = five-striped-flags("red", "white", "blue", "green", "yellow")
  flag2 = five-striped-flags("black", "red", "gold", "green", "blue")
  
  # These should create Image objects
  flag1 satisfies is-image
  flag2 satisfies is-image
end

# Example usage:
example-flag = five-striped-flags("red", "white", "blue", "green", "yellow")
# This creates a flag with:
# - Top stripe: red (largo x ancho/5)  
# - Second stripe: white (largo x ancho/5)
# - Middle stripe: blue (largo x ancho/5)
# - Fourth stripe: green (largo x ancho/5)  
# - Bottom stripe: yellow (largo x ancho/5)
# All wrapped in a frame