// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func main(): Int64 {
    var myTuple: Int32*Int32 = (0,1)
    var a = myTuple[] // EXPECTED: regex tuple index must be an integer literal
    return a
}
