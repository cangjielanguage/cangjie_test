// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main() : Int64 {
    var a:Int64 = 1

    if ( !(a == 'a')){
        return 1
    }
    if ( a == 'b' ){
        return 2
    }
    return 0
}

extend Int64 {
    operator func ==(right:Char):Bool {
        if (right == 'a') {
            return true
        }else{
            return false
        }
    }
}