// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func main() {
    var i : Int64 = 1
    var x : Int64 = 2
    var y : Int64 = 3
    var flag : Bool = true
    var a : Int64 = match (i) {
        case _ if (+x) => i // EXPECTED: regex invalid expression initialization
    }
    return (a-1)
}
