// EXEC-PIPE-1:%compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f


open class Base{}
class Sub <: Base{
  func ff (x: Sub, y!: Int32 =0):Int32 {4}
  func ff (x: Sub):Int32 {5}
}

func main(): Int64 {
    var b = Sub().ff // EXPECTED: regex ambiguous match for assigning function 'ff' to variable
    return 0
}


