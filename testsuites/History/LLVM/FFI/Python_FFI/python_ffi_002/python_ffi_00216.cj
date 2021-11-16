// EXEC: echo "python=%libdir/ffi/cangjieFFI.cjo" > %n.conf
// EXEC: %compiler %cmp_opt %f %libdir/ffi/cangjieFFI.o -import-config ./%n.conf -backend-options="-ldl" -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex pass

import python.*

func main():Int64 {
  var a = LoadPython()
  //var p = a.GetBuiltin("print")
  //p.Call(PythonString("pass"))
  UnloadPython()
  var b = LoadPython()
  var p = b.GetBuiltin("print")
  p.Call(PythonString("pass"))
  UnloadPython()
  return 0
}
