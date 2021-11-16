// EXEC: %compiler %cmp_opt -c %n.cj -o %output 2>&1 | compare %f

class A {
  var b: Int32
  A(b!: Int32 = 0){
    this.b = b
  }
}

extend A {
  static public func me() {
    b = 0 //EXPECTED: regex 'b' is non-static member, cannot be accessed by static function 'me'
    return 2
  }
}

func main(): Int64 {
  return Int64(A.me())
}
