// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
class A{

}

extend A {
  public func me() {
    return 5
  }
}

func main(): Int64 {
  return A().me() - 5
}