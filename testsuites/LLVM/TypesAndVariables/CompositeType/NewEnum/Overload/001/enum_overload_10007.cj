// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f


enum E{|e}

var e : Int64 = 1

func main(): Int64 {
    var a = e // EXPECTED: regex enum sugar access 'e' conflict with variable name, try to use with prefix
    return 0
}
