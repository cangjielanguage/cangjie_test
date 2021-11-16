// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f


enum E{e}

func e<T>(){}

func main(): Int64 {
    var a = e // EXPECTED: regex enum sugar access 'e' conflict with function name, try to use with prefix
    return 0
}
