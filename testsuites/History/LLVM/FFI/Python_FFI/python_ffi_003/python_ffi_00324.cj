// EXEC: echo "python=%libdir/ffi/cangjieFFI.cjo" > %n.conf
// EXEC: %compiler %cmp_opt %f %libdir/ffi/cangjieFFI.o -import-config ./%n.conf -backend-options="-ldl" -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex 'a': '1'
import python.*

func main():Int64 {
  var python = LoadPython()
  var prt = python.GetBuiltin("print")
  var pyDic2 = PythonDic()
  pyDic2.`Set`(PythonString("a"), PythonString("1"))
  var a = PythonList(2)
  a.SetItem(0,PythonString("a"))
  a.SetItem(1,PythonString("2"))
  var b = PythonList(1)
  b.SetItem(0,a)
  pyDic2.MergeFromSeq2(b,false)
  prt.Call(pyDic2)
  UnloadPython()
  return 0
}
