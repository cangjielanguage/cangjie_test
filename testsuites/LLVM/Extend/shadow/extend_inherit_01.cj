// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

class B<:A{
	
}

open class A{
	
}

extend A {
  static func foo1(a: Int32, b!:Int64 = 0): Int32{ 
    return a
	}
}

extend A {
  func foo2(a: Int32, b!:Int64 = 0): Int32{
    return a
	}
}


extend A {
  static func foo3(){
    return 1
	}
}

extend A {
  func foo4(){
    3
	}
}

func main(): Int64 {
  let a = Int64(B.foo1(1)) + Int64(B().foo2(1)) + B.foo3() + B().foo4()
    return a -6
}