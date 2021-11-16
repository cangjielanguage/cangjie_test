// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func main(): Int64 {
    if (!True) {  // EXPECTED: regex undeclared identifier 'True'
        return 1
    }
    return 0 
}
