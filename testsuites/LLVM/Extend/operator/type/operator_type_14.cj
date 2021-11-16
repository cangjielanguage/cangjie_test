// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main() : Int64 {
    var a:Char = '1'

    if ( !(a == 10)){
        return 1
    }
    if ( a == 20 ){
        return 2
    }
    return 0
}

extend Char {
    operator func ==(right:Int64):Bool {
        if (right == 10) {
            return true
        }else{
            return false
        }
    }
}