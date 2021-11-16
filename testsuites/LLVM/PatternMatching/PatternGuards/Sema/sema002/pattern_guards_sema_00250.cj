// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func main(){
    var a : Array<Bool> = {true}
    var i : Int64 = 1
    var y : Int64 = match (i) {
        case _ if (do) {true} while (true => i)   // EXPECTED: regex expected block begin with '{'
    }
    return y-1
}
