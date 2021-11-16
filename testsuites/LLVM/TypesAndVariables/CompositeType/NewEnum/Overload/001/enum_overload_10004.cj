// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func None<T>(a:T){}

func main(): Int64 {
    var a = None(1) // EXPECTED: regex enum sugar access 'None' conflict with function name, try to use with prefix
    return 0
}
