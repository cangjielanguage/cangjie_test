// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f


enum E{|List}


func main(): Int64 {
    var a = List // EXPECTED: regex enum sugar access 'List' conflict with type name, try to use with prefix
    return 0
}
