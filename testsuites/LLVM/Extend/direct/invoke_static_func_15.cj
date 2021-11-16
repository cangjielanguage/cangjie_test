// EXEC: %compiler %cmp_opt -c %n.cj -o %output 2>&1 | compare %f

class A {
  var b: Int32
  A(b!: Int32 = 0){
    this.b = b
  }
}

extend A {
  static public func me() {
    return this.b //EXPECTED: regex non-static variable 'this' cannot be referenced from a static context
  }
}

func main(): Int64 {
  return Int64(A.me())
}
