// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func main(){
    var i : Int64 = 1
    var y : Int64 = match (i) {
        case _ if (Int32(1)) => i // EXPECTED: regex expected an expression of type 'Bool', but got 'Int32'
    }
    return y-1
}
