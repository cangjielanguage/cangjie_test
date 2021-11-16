// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

var a = 0

open class C1a {
  open func f() {
    a = 3
  } 
}

open class C1b <: C1a{

}

open class C1c <: C1b{
  override open func f() {
    a = 5
  } 
}

open class C1d <: C1c{

}

open class C1e <: C1d{

}

open class C1f <: C1e{

}

open class C1g <: C1f{

}

open class C1h <: C1g{

}

open class C1i <: C1h{

}




class C2 <: C1i{
  override func f() {
    super.f()
  } 
}


func main(): Int64 {
    C2().f()
    return (a - 5)
}
