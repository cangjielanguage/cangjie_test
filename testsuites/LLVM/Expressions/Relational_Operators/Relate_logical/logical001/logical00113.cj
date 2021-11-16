// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func main(): Int64 {
    if (!False) {  // EXPECTED: regex undeclared identifier 'False'
        return 1
    }
    return 0 
}
