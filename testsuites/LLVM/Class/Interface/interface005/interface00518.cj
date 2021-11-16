// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

interface I0{
  static func F0():Int32{return 1}
}

interface I1 <: I0{
  static func F0():Int32{return 0}
}

class C <: I1 {

}

func main(): Int64 {
    var res = C.F0()
    if (res != 0) {
        return 1
    }
    return 0
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
