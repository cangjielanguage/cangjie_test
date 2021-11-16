// EXEC: echo "python=%libdir/ffi/cangjieFFI.cjo" > %n.conf
// EXEC: %compiler %cmp_opt %f %libdir/ffi/cangjieFFI.o -import-config ./%n.conf -backend-options="-ldl" -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex enumerate object
import python.*

func main():Int64 {
  var python = LoadPython()
  var p = python.GetBuiltin("print")
  var e = python.GetBuiltin("enumerate")
  var res = e.Call(PythonTuple(PythonInt(5),PythonInt(2)))
  p.Call(res)
  UnloadPython()
  return 0
}
