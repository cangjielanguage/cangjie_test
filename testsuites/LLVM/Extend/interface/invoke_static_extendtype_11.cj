// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

extend Float16 <: I{
  static func me() { 
    return foo()
  }
}

interface I{
  static func foo(){
    1.0
  }
}

func main(): Int64 {
  if(Float16.me() == 1.0){
    return 0
  }
  return 2
}