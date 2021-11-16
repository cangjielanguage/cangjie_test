// EXEC: echo "python=%libdir/ffi/cangjieFFI.cjo" > %n.conf
// EXEC: %compiler %cmp_opt %f %libdir/ffi/cangjieFFI.o -import-config ./%n.conf -backend-options="-ldl" -o %output
// EXEC: %run %run_opt %output %run_args
import python.*

func main():Int64 {
  var python = LoadPython()
  var p = python.GetBuiltin("print")
  var l1 = PythonList(3)
  var input1 = PythonInt(1)
  var res = l1.GetSize()
  if (res != 3) {
    return 1
  }
  UnloadPython()
  return 0
}
