// EXEC: echo "python=%libdir/ffi/cangjieFFI.cjo" > %n.conf
// EXEC: %compiler %cmp_opt %f %libdir/ffi/cangjieFFI.o -import-config ./%n.conf -backend-options="-ldl" -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex 0b1010
import python.*

func main():Int64 {
  var python = LoadPython()
  var p = python.GetBuiltin("print")
  var t = PythonInt(10)
  var b = python.GetBuiltin("bin")
  p.Call(b.Call(t))
  UnloadPython()
  return 0
}
