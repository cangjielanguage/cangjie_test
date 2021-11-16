// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f

func main() : Int64 {
    var a:Int8 = 1

    if ( !(a == 'a')){
        return 1
    }
    if ( a == 'b' ){
        return 2
    }
    return 0
}

extend Int8 {  // EXPECTED: regex note.* to match this '{'
    operator func ==(right:Char):Bool {
        if (right == 'a') {
            return true
        }else{
            return false
        }
    } // EXPECTED: regex error.*? expected '}'
