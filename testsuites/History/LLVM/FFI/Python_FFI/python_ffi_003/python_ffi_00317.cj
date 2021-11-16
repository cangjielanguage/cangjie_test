// EXEC: echo "python=%libdir/ffi/cangjieFFI.cjo" > %n.conf
// EXEC: %compiler %cmp_opt %f %libdir/ffi/cangjieFFI.o -import-config ./%n.conf -backend-options="-ldl" -o %output
// EXEC: %run %run_opt %output %run_args
import python.*

func main():Int64 {
  var python = LoadPython()
  var d1 = PythonDic()
  var d2 = PythonDic(d1.GetPtr())
  d1.`Set`("a",PythonInt(1))
  d1.`Set`(PythonString("b"),PythonInt(2))
  d1.Del("a")
  var res1 = d1.Contains(PythonString("b"))
  if (res1 != true) {
    return 1
  }
  var res2 = d1.Contains(PythonString("a"))
  if (res2 != false) {
    return 2
  }
  UnloadPython()
  return 0
}
