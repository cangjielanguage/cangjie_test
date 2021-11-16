// EXEC: %compiler %cmp_opt -c %n.cj -o %output 2>&1 | compare %f

class A{
    static let b : Int32 = 0
}

extend A {
  static public func me(a:Int32) {
    b = a //EXPECTED: regex cannot assign to value which is an initialized 'let' constant

  }
}

func main(): Int64 {
  return 0
}