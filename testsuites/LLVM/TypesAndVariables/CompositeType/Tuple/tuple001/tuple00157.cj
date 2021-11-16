// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func main(): Int64 {
    var a : Int32 = 1
    var MyTuple : Int32*Int32 = {a,a}   // EXPECTED: regex expected '=>' in the lambda function
    return 0
}
