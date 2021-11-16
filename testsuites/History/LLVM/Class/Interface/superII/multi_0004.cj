// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

var a = 0

interface I1a {
  func f() {
    a = 3
  } 
}

interface I1b <: I1a{

}

interface I1c <: I1b{
  func f() {
    a = 5
  } 
}

interface I1d <: I1c{

}

interface I1e <: I1d{

}

interface I1f <: I1e{

}

interface I1g <: I1f{

}

interface I1h <: I1g{

}

interface I1i <: I1h{

}




interface I2 <: I1i{
  func f() {
    super<I1i>.f()
  } 
}

class Data <: I2{
  
}


func main(): Int64 {
    Data().f()
    return (a - 5)
}
