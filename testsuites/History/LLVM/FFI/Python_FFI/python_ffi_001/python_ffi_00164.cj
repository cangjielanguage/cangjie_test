// DEPENDENCE: python_ffi_00115
// EXEC: export PYTHONPATH=pwd:$PYTHONPATH
// EXEC: echo "python=%libdir/ffi/cangjieFFI.cjo" > %n.conf
// EXEC: %compiler %cmp_opt %f %libdir/ffi/cangjieFFI.o -import-config ./%n.conf -backend-options="-ldl" -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex python_ffi_00115.test
import python.*

func main():Int64 {
  var python = LoadPython()
  var p = python.GetBuiltin("print")
  var myModule = python.Import("python_ffi_00115.test")
  var v = python.GetBuiltin("vars")
  p.Call(v.Call(myModule.Get("A")))
  UnloadPython()
  return 0
}
