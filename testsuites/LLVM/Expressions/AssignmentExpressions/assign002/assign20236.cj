// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func main(): Int64 {
    var l : bigFloat = 0 // EXPECTED: regex undeclared type name 'bigFloat'
    var r : bigInt = 1   // EXPECTED: regex undeclared type name 'bigInt'
    l = r
    return 0
}
