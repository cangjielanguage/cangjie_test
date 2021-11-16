// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

extend Bool <: I{
  static func me() { 
    return foo()
  }
}

interface I{
  static func foo(){
    true
  }
}


func main(): Int64 {
  if(Bool.me() ){
    return 0
  }
  return 2
}