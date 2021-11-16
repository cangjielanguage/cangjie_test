// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func main(): Int64 {
    var a : ?Int64 = 1
    var b : Int64 =  a?? ; // EXPECTED: regex expected expression here
    return 0
}
