// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main() : Int64 {
    var a:Int32 = 1

    if ( a << 'a' != 55 ) {
        return 1
    }
    if ( a << 'b' != 66 ) {
        return 2
    }
    return 0
}

extend Int32 {
    operator func <<(right:Char):Int32 {
        if (right == 'a') {
            return 55
        }else{
            return 66
        }
    }
}