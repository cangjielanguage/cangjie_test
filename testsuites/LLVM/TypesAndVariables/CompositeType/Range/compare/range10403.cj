// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func main(): Int64 {
    var a : Range<Float64> = 0.5..5.5:2 //EXPECTED: regex generics type arguments do not match the constraint
    var b : Range<Float64> = 0.5..=5.5:2
    if(a == b){
      return 0
    }
    return 2
}
