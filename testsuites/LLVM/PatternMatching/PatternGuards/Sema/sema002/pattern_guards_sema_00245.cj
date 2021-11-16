// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func main(){
    var i : Int64 = 1
    var y : Int64 = match (i) {
        case _ if (match (i)) {case _ => 1} => i // EXPECTED: regex expected '{' here
    }
    return y - 1
}
