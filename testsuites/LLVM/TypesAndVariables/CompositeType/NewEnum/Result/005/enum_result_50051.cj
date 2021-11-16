// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func test():Result<Int64>{
    while (false){
        break??break // EXPECTED: regex type of left operand does not support coalescing operation. coalescing is only valid for 'Option' and 'Result'
    }
    return Ok(0)
}

func main(): Int64 {
    return test() ?? 1
}
