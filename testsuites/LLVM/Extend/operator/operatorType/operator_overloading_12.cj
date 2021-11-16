// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main() : Int64 {
    var a:Int32 = 1

    if ( -a != "abc" ){
        return 1
    }
    return 0
}

extend Int32 {
    operator func -(): String { // EXPECTED: regex-auto operator func -() of type Int32 is a built-in function and cannot be overridden
        return "abc"
    }
}
