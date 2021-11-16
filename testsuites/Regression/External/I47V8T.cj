// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

from std import serialization.*
from std import format.*
from std import convert.*

from std import io.*

func deserialize(str: String) : Bool {
  let b: Bool = parseBool(str).getOrThrow()
  return b
}

func main() {
  print("${deserialize("true")}")
  0
}
