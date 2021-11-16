// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main() : Int64 {
    var a : Int32 = 1
    if ( a == A() ) {
        return 1
    }
    return 0
}

class A {
    let tmp = 66
}

extend Int32 {
    operator func ==(right:A,left:A):Bool { // error: invalid number of parameters for operator '=='
        if (right.tmp == 66) {
            return false
        }else{
            return true
        }
    }
}