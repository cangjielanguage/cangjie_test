// EXEC-PIPE-1: %compiler %cmp_opt -c %n.cj -o %output 2>&1 | compare %f

class A{}

func foo(a:Int32, b!:Int64 = 1): A{
  return A()	
}

extend foo {  // EXPECTED: regex extending type 'Invalid' is not allowed
    // func plus() { 1 }
}

func main(): Int64 {
    return 0
}
