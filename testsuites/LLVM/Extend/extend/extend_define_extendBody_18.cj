// EXEC: %compiler %cmp_opt -c %n.cj -o %output 2>&1 | compare %f

interface I {}

extend Int64 <: I{ 
  class A{}  //EXPECTED: regex illegal extend member, only functions, props, associated types are allowed
}

func main(): Int64{
  return 0
}