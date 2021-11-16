// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main() : Int64 {
    var a:Int32 = 1
    var b:Char = 'b'
    var c:Char = 'c'

    if (!(a == b)) {
        return 1
    }
    if ( a == c ) {
        return 2
    }
    return 0
}

extend Int32 {
    operator func ==(right:Char):Bool {
        if (right == 'b') {
            return true
        }else{
            return false
        }
    }
}