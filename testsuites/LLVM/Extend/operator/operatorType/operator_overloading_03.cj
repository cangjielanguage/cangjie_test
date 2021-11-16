// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main() : Int64 {
    return 0
}

extend Int32 {
    operator func ._(): Bool { //error: illegal operator '._' for overloading
        return true
    }
}