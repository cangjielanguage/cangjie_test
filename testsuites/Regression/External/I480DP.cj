// EXEC: %compiler %cmp_opt  -backend-options="-L $CANGJIE_HOME/lib -lcangjie-json" %f  -o %output
// EXEC-PIPE-0: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan ["a","b"]

from std import serialization.*
from std import json.*

func main() {
   print(JsonValue.fromStr("[\"a\", \"b\"]").toString())
   0
}
