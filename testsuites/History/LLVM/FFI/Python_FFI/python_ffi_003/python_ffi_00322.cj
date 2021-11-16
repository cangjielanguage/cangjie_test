// EXEC: echo "python=%libdir/ffi/cangjieFFI.cjo" > %n.conf
// EXEC: %compiler %cmp_opt %f %libdir/ffi/cangjieFFI.o -import-config ./%n.conf -backend-options="-ldl" -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex 1
import python.*

func main():Int64 {
  var python = LoadPython()
  var p = python.GetBuiltin("print")
  var d1 = PythonDic()
  d1.`Set`("a",PythonInt(1))
  d1.`Set`("b",PythonInt(2))
  var d2 = PythonDic()
  d2.`Set`("a",PythonInt(3))
  d1.Merge(d2,false)
  var res2 = d1.Get("a")
  p.Call(res2)
  UnloadPython()
  return 0
}
