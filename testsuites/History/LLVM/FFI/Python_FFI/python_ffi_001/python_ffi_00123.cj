// EXEC: echo "python=%libdir/ffi/cangjieFFI.cjo" > %n.conf
// EXEC: %compiler %cmp_opt %f %libdir/ffi/cangjieFFI.o -import-config ./%n.conf -backend-options="-ldl" -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex 1.0
import python.*

func main():Int64 {
  var python = LoadPython()
  var f = python.GetBuiltin("float")
  var p = python.GetBuiltin("print")
  p.Call(f.Call(PythonInt(1)))
  UnloadPython()
  return 0
}
