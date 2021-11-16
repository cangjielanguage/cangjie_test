// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main() : Int64 {
    var a:Int8 = 1

    if ( !(a == 'a')){ //error: argument is mismatched with parameter type 'Int8'
        return 1
    }
    if ( a == 'b' ){
        return 2
    }
    return 0
}

extend Int8 {
    private operator func ==(right:Char):Bool {
        if (right == 'a') {
            return true
        }else{
            return false
        }
    }
}