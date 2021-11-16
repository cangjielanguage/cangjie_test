// EXEC: echo "python=%libdir/ffi/cangjieFFI.cjo" > %n.conf
// EXEC: %compiler %cmp_opt %f %libdir/ffi/cangjieFFI.o -import-config ./%n.conf -backend-options="-ldl" -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex -1
// ASSERT: regex -1234567
// ASSERT: regex 1234567
import python.*

func main():Int64 {
  var python = LoadPython()
  var p = python.GetBuiltin("print")
  var a = python.GetBuiltin("abs")
  p.Call(PythonInt(-1))
  p.Call(PythonInt(-1234567))
  p.Call(a.Call(PythonInt(-1234567)))
  UnloadPython()
  return 0
}
