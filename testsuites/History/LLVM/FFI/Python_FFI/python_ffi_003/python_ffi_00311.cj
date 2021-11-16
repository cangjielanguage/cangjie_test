// EXEC: echo "python=%libdir/ffi/cangjieFFI.cjo" > %n.conf
// EXEC: %compiler %cmp_opt %f %libdir/ffi/cangjieFFI.o -import-config ./%n.conf -backend-options="-ldl" -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex \(0, 1, 2\)
import python.*

func main():Int64 {
  var python = LoadPython()
  var p = python.GetBuiltin("print")
  var l1 = PythonList(3)
  l1.SetItem(0,PythonInt(0))
  l1.SetItem(1,PythonInt(1))
  l1.SetItem(2,PythonInt(2))
  var t1 = l1.ToPythonTuple()
  p.Call(t1)
  UnloadPython()
  return 0
}
