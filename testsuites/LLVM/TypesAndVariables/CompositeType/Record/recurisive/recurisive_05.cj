// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

record R5 {
  let other: E1 
} 

enum E1 {
  A(R5) 
}

func main(): Int64{
	return 0
}