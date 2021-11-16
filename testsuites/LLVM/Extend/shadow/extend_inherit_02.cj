// EXEC: %compiler %cmp_opt -c %n.cj -o %output 2>&1 | compare %f

class B<:A{
  func foo2(a: Int32, b!:Int64 = 0): Int32{  //EXPECTED: regex cannot override function 'foo2' in extend of supertype
    return a
  }
}

open class A{

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
  return 0
}
