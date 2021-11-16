// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

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
    operator func ==(right:A):Bool {
        if (right.tmp == 66) {
            return false
        }else{
            return true
        }
    }
}