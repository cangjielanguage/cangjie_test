// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func main(): Int64 {
    var l : bigInt = 0    // EXPECTED: regex undeclared type name 'bigInt'
    var r : bigFloat = 1  // EXPECTED: regex undeclared type name 'bigFloat'
    l = r
    return 0
}
