// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main() : Int64 {
    return 0
}

extend Int32 {
    operator func ==(right:Int32):Bool { // EXPECTED: regex-auto operator func ==(Int32) of type Int32 is a built-in function and cannot be overridden 
        if (right == 0) {
            return true
        }else{
            return false
        }
    }
}
