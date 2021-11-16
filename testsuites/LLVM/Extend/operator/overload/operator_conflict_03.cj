// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main() : Int64 {
    var a:Int32 = 1

    if (!(a == 1)) {
        return 1
    }
    return 0
}

extend Int32 {
    operator func ==(right:Char):Bool {
        if (right == 'a') {
            return true
        }else{
            return false
        }
    }
    operator func ==(right:Int64):String {
        if (right == 1) {
            return "abc"
        }else{
            return "cba"
        }
    }
}