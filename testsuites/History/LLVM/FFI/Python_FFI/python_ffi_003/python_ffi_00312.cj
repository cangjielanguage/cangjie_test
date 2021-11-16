// EXEC: echo "python=%libdir/ffi/cangjieFFI.cjo" > %n.conf
// EXEC: %compiler %cmp_opt %f %libdir/ffi/cangjieFFI.o -import-config ./%n.conf -backend-options="-ldl" -o %output
// EXEC: %run %run_opt %output %run_args
import python.*

func main():Int64 {
  var python = LoadPython()
  var p = python.GetBuiltin("print")
  var l = PythonTuple(PythonInt(1),PythonInt(1))
  var s1 = PythonSet(l)
  var s2 = PythonSet(s1.GetPtr())
  UnloadPython()
  return 0
}
