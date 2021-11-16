// EXEC: %compiler %cmp_opt -c %n.cj -o %output 2>&1 | compare %f

class A{

}

extend A {
  public func me(a: This) { // EXPECTED: regex 'This' type is not allowed here
    return 0
  }
}

func main(): Int64 {
  return 0
}