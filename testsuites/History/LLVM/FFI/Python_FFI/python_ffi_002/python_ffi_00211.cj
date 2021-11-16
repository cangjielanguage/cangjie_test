// EXEC: echo "python=%libdir/ffi/cangjieFFI.cjo" > %n.conf
// EXEC: %compiler %cmp_opt %f %libdir/ffi/cangjieFFI.o -import-config ./%n.conf -backend-options="-ldl" -o %output
// EXEC: %run %run_opt %output %run_args

import python.*

func main():Int64 {
  var python = LoadPython()
  var p = python.GetBuiltin("print")
  p.`Set`(PythonString("a"),PythonString("a"))
  p.Del(PythonString("b"))
  UnloadPython()
  return 0
}
