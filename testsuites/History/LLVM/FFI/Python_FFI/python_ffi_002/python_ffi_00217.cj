// EXEC: echo "python=%libdir/ffi/cangjieFFI.cjo" > %n.conf
// EXEC: %compiler %cmp_opt %f %libdir/ffi/cangjieFFI.o -import-config ./%n.conf -backend-options="-ldl" -o %output
// EXEC: %run %run_opt %output %run_args

import python.*

func main():Int64 {
  var a = LoadPython()
  var charInt32 : Int32 = 1
  var charBool : Bool = true
  var charFloat32 : Float32 = 0.1
  var charFloat64 : Float64 = 0.1
  var charString : String = "a"
  if (charInt32 != PythonInt(charInt32).ToInt32()) {
    return 1
  }
  if (charBool != PythonBool(charBool).ToBool()) {
    return 2
  }
  if (charFloat32 != PythonFloat(charFloat64).ToFloat32()) {
    return 3
  }
  if (charFloat64 != PythonFloat(charFloat64).ToFloat64()) {
    return 4
  }
//  if (charString != PythonString(charString).ToString()) {
//    return 5
//  }
  UnloadPython()
  return 0
}
