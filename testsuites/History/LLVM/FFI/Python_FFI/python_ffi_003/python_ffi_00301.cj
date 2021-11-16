// EXEC: echo "python=%libdir/ffi/cangjieFFI.cjo" > %n.conf
// EXEC: %compiler %cmp_opt %f %libdir/ffi/cangjieFFI.o -import-config ./%n.conf -backend-options="-ldl" -o %output
// EXEC: %run %run_opt %output %run_args
import python.*

func main():Int64 {
  var python = LoadPython()
  var t1 = PythonTuple(3)
  var t2 = PythonTuple(t1.GetPtr())
  var t3 = PythonTuple(PythonInt(1))
  var t4 = PythonTuple(PythonInt(1),PythonInt(2))
  var t5 = PythonTuple(PythonInt(1),PythonInt(2),PythonInt(3))
  var t6 = PythonTuple({PythonInt(1)})
  UnloadPython()
  return 0
}
