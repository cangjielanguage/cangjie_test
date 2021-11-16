// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

class A<:Exception{}

enum e<X>{
    Ok(X) | Err(Throwable)
}

func main(): Int64 {
    var a : e<Int64> = Err(A())
    a??0 // EXPECTED: regex type of left operand does not support coalescing operation. coalescing is only valid for 'Option' and 'Result'
}
