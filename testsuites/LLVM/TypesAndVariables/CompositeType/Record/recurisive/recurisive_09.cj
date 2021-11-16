// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f

record R { //EXPECTED: regex value type recursive detected: 'R->R'
  let other: R*Int64
} 

func main(): Int64{
	return 0
}