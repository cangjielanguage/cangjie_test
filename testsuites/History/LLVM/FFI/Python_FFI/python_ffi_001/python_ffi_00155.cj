// DEPENDENCE: python_ffi_00115
// EXEC: export PYTHONPATH=pwd:$PYTHONPATH
// EXEC: echo "python=%libdir/ffi/cangjieFFI.cjo" > %n.conf
// EXEC: %compiler %cmp_opt %f %libdir/ffi/cangjieFFI.o -import-config ./%n.conf -backend-options="-ldl" -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex None
import python.*

func main():Int64 {
  var python = LoadPython()
  var p = python.GetBuiltin("print")
  var myModule = python.Import("python_ffi_00115.test")
  var s = python.GetBuiltin("setattr")
  var input = PythonTuple(myModule.Get("A"),PythonString("b"),PythonInt(1))
  p.Call(s.CallByTup(input))
  UnloadPython()
  return 0
}
