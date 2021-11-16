// EXEC: echo "python=%libdir/ffi/cangjieFFI.cjo" > %n.conf
// EXEC: %compiler %cmp_opt %f %libdir/ffi/cangjieFFI.o -import-config ./%n.conf -backend-options="-ldl" -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex 1
import python.*

func main():Int64 {
  var python = LoadPython()
  var p = python.GetBuiltin("print")
  var t = PythonString("1")
  var c = python.GetBuiltin("chr")
  var o = python.GetBuiltin("ord")
  p.Call(c.Call(o.Call(t)))
  UnloadPython()
  return 0
}
