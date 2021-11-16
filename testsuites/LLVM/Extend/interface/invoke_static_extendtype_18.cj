// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
enum TimeUnit{
	Month |
	Year
}

extend TimeUnit <: I{
  static func Day() { 
    return foo()
  }
}

interface I{
  static func foo(){
    0
  }
}

func main(): Int64 {
  return TimeUnit.Day()
}