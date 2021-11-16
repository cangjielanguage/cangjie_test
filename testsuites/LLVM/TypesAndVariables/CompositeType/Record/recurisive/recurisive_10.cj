// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f

record R {
  let other: R2*Int64
}

record R2 { //EXPECTED: regex value type recursive detected: 'R2->R->R2'
  let other: Int64*Float64*Unit*R*Int64*R3
}

record R3 { //EXPECTED: regex value type recursive detected: 'R3->R2->R3'
  let other: R2*Int64
}


func main(): Int64{
	return 0
}