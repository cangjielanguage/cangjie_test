// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f


enum E{|e}

class e{}

func main(): Int64 {
    var a = e // EXPECTED: regex enum sugar access 'e' conflict with type name, try to use with prefix
    return 0
}
