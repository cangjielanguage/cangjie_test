// EXEC: echo "python=%libdir/ffi/cangjieFFI.cjo" > %n.conf
// EXEC: %compiler %cmp_opt %f %libdir/ffi/cangjieFFI.o -import-config ./%n.conf -backend-options="-ldl" -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex 1, 2, 3
import python.*

func main():Int64 {
  var python = LoadPython()
  var p = python.GetBuiltin("print")
  var s = python.GetBuiltin("sorted")
  var input = PythonTuple(PythonInt(1),PythonInt(3),PythonInt(2))
  p.Call(s.Call(input))
  UnloadPython()
  return 0
}
