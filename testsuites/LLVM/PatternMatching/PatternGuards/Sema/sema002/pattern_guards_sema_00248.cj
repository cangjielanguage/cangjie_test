// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func main(){
    var i : Int64 = 1
    var y : Int64 = match (i) {
        case _ if (while (true)) {true} => i // EXPECTED: regex expected block begin with '{'
    }
    return y - 1
}
