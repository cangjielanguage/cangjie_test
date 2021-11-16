// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

class B<:A{
  func fooB2(){
    Int64(foo1(1)) + Int64(foo2(1)) + foo3() + foo4()
  }

  func fooB1(){
    Int64(foo1(1)) + Int64(super.foo2(1)) + foo3() + super.foo4()
  }

  func fooB3(){
    Int64(foo1(1)) + Int64(this.foo2(1)) + foo3() + this.foo4()
  }
  
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
    return B().fooB1() + B().fooB2() + B().fooB3() - 18
}