// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args
enum TimeUnit{
	Month |
	Year
}

extend TimeUnit {
  static func Day() { 
    return 0
  }
}

func main(): Int64 {
  return TimeUnit.Day()
}