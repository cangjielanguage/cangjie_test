// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func main(): Int64 {
    var a  = 0.5..5.5:2  // EXPECTED: regex integer type is expected for start, stop and step in range expression
    var b  = 0.5..=5.5:2
    if(a == b){
      return 0
    }
    return 2
}
