// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

var a = Ok(1)! // ASSERT: scan 'return' is not in funcbody

func main(): Int64 {
    return 0
}
