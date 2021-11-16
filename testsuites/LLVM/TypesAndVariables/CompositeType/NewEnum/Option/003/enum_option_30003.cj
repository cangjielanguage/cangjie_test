// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f


func main(): Int64 {
    var a : ?Int64 = 1
    var b : Int64 = a ?? true // EXPECTED: regex type of coalescing's right operand does not match type 'Int64'
    return 0
}
