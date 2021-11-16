// EXEC: %compiler %cmp_opt  -backend-options="-L $CANGJIE_HOME/lib -lcangjie-json" %f  -o %output
// EXEC: %run %run_opt %output %run_args

from std import serialization.*
from std import json.*

func main() {
   JsonValue.fromStr("1")
   return 0
}
