// EXEC: echo "python=%libdir/ffi/cangjieFFI.cjo" > %n.conf
// EXEC: %compiler %cmp_opt %f %libdir/ffi/cangjieFFI.o -import-config ./%n.conf -backend-options="-ldl" -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex 2
import python.*

func main():Int64 {
  var python = LoadPython()
  var p = python.GetBuiltin("print")
  var e = python.GetBuiltin("eval")
  var pyDic = PythonDic()
  var res = e.Call({PythonString("1+1"),pyDic,pyDic})
  p.Call(res)
  UnloadPython()
  return 0
}
