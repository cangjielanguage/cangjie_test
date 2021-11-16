// EXEC: %compiler %cmp_opt -c %n.cj -o %output 2>&1 | compare %f
interface I{
	func foo(){
	  return 1
	}
}

class A{

}

extend A <: I{
  public func me(a: This) { // EXPECTED: regex 'This' type is not allowed here
    return 0
  }
}

func main(): Int64 {
  return 0
}