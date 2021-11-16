// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex function 'F0' cannot be accessed by interface name 'I0'
interface I0{
  static func F0():Int64{return 0}
}

func main():Int64{
  var a = I0.F0()
  return I0.F0()
}

