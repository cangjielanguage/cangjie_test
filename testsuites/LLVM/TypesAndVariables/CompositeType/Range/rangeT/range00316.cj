// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
  var a = -9223372036854775808..-9223372036854775808:-9223372036854775808
  for (i in a){
    print(i.toString())
  }
	if(a.isEmpty()){
    return 0
  }
  return 2
}

