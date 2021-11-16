// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

var input:Int32 = 1
var f = match ( input ){
    case x => var a: Int32 = 1;var x1 = {a} // EXPECTED: regex lambda captured a mutable variable directly, lambda cannot be assigned to a variable
}

func main():Int64 {
    if ( f != () ){
        return 1
    }
    return 0
}
