// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func main() {
    var exp = Exception()
    try {
        throw exp
    } catch (t:Throwable) {
        var t = 0
        return t
    }
}
