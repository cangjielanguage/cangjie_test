// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func main(): Int64 {
    let a = Array<Int32>..Array<Int32>:Array<Int32>  // EXPECTED: regex-auto expected '('expression')' after type to make an array literal
    return 1
}
