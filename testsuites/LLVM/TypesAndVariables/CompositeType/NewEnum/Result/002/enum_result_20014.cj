// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

enum Option<X>{
    Some(X) | None
}

func main(): Int64 {
    var a : Option<Int64> = Some(1)
    a??0 // EXPECTED: regex type of left operand does not support coalescing operation. coalescing is only valid for 'Option' and 'Result'
}
