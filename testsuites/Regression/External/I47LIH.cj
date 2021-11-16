// EXEC: %compiler %cmp_opt  %f -backend-options="-L./ -lcangjie-json" -o %output
// EXEC-PIPE-0: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan "\\n"

from std import serialization.*
from std import io.*
from std import json.*

func main() {
  let s = "\n".serialize().toJson().toString()
  print(s)
  0
}

