// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

class A {
  var b: Int32
  A(b!: Int32 = 0){
    this.b = b
  }
}

extend A {
  public func me() {
    return this.b
  }
}

func main(): Int64 {
  return Int64(A(b: 0).me())
}