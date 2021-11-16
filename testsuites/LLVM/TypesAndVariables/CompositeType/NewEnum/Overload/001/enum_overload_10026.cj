// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f


enum E{
|e(Int64)
|e(Int64,Int64)
}

var e = {}

func main(): Int64 {
    //e()
    e(1) // EXPECTED: regex enum sugar access 'e' conflict with variable name, try to use with prefix
    e(1,1) // EXPECTED: regex enum sugar access 'e' conflict with variable name, try to use with prefix
    return 0
}
