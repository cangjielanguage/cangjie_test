// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f


enum E{|main}

func main(): Int64 {
    var a = main // EXPECTED: regex enum sugar access 'main' conflict with function name, try to use with prefix
    return 0
}
