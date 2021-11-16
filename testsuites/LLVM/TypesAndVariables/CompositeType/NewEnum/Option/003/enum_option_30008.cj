// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func main(): Int64 {
    // can not let 1 be Some(1) here.
    var b : Int64 =  1??2 // EXPECTED: regex type of left operand does not support coalescing operation. coalescing is only valid for 'Option' and 'Result'
    return b - 1
}
