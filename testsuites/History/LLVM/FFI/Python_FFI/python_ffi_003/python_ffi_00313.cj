// EXEC: echo "python=%libdir/ffi/cangjieFFI.cjo" > %n.conf
// EXEC: %compiler %cmp_opt %f %libdir/ffi/cangjieFFI.o -import-config ./%n.conf -backend-options="-ldl" -o %output
// EXEC: %run %run_opt %output %run_args
import python.*

func main():Int64 {
  var python = LoadPython()
  var p = python.GetBuiltin("print")
  var l = PythonTuple(PythonInt(1),PythonInt(1))
  var s1 = PythonSet(l)
  var res1 = s1.Add(PythonInt(2))
  if (res1 != true) {
    return 1
  }
  var res2 = s1.Contains(PythonInt(2))
  if (res2 != true) {
    return 2
  }
  var res3 = s1.GetSize()
  if (res3 != 2) {
    return 3
  }
  UnloadPython()
  return 0
}
