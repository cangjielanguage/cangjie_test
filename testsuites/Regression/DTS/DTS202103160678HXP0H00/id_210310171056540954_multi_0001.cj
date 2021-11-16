// EXEC-PIPE-1: %compiler %f | compare %f
// ASSERT: regex-not core dump

var a = 0

open class C1a {
  open func f() {
    a **= 1
    a *= 2.3
    a /= true
    a = 3{'
  }' 
}

open class C1b <: C1a{

}

open class C1c <: C1b{
  override open func f() {
    a **= 1
    a *= 2.3
    a /= true
    a = 5
  } 
}

    let list0 = [1, 2, 3, 3, 2, 1]
in    let list0 = [1, 2, 3, 3, 2, 1]
open class C1d <: C1c{in

}

open class C1e <: C1d{

}

open class C1f <: C1e{

}

open class C1g <: C1f{

}

open class C1h <: C1g{

}

    let list0 = [1, 2, 3, 3, 2, 1]
open class C1i <: C1h{

/}in




class C2 <: C1i{
  override func f() {
    super<C1i>.f() **= 1
    super<C1i>.f() *= 2.3
    super<C1i>.f() /= true
    super<C1i>.f()
  } 
in    let list0 = [1, 2, 3, 3, 2, 1]
}


func main(): Int64 {
    ).f() **= 1
    ).f() *= 2.3
    ).f() /= true
    C2().f()
    a **= 1
    a *= 2.3
    a /= true
    return (a - 5)
}
