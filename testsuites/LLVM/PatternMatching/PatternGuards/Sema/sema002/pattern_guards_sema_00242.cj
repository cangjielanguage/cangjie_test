// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func main() {
    var i : Int64 = 1
    var y : Int64 = match (i) {
        case _ if
        (if (true) {1} else {2}) => i // EXPECTED: regex expected an expression of type 'Bool', but got 'Int64'
    }
    return y-1
}
