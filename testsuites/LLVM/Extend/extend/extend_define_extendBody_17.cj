// EXEC: %compiler %cmp_opt -c %n.cj -o %output 2>&1 | compare %f

interface I {}

extend Int64 <: I{ 
  typealies Point2D = Float64*Float64  //EXPECTED: regex illegal class member in extend block
}

func main(): Int64{
  return 0
}