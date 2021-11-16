// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func x():Int64{return 1}
func main(){
    var i : Int64 = 1
    var a : Int64 = match (i) {
        case _ if (x()) => i // EXPECTED: regex no matching function declaration for function call 'x'
    }
    return (a-1)
}
