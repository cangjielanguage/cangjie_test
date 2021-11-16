// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func main(){
    var a : Array<Bool> = {true}
    var i : Int64 = 1
    var y : Int64 = match (i) {
        case _ if (func test():Bool) {true} => i // EXPECTED: regex-auto missing ')' in patternGuard expression
    }
    return y-1
}
