// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main() : Int64 {
    var a:Int32 = 1
    return 0
}

class A {}

extend Int32 {
    operator func !(right: A): String { //error: invalid number of parameters for operator '!'
        return "abc"
    }
}