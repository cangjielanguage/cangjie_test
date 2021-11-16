// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan abc


func main() {
    var err = Error()
    var exp = Exception()
    var rte = RuntimeException()
    if (!(err is Throwable && exp is Throwable && rte is Throwable)) {
        return 2
    }
    try {
        print("a")
        throw err
    } catch (_:Throwable) {
        try{
            print("b")
            throw exp
        } catch (_:Throwable) {
            try{
                print("c")
                throw rte
            } catch (_:Throwable) {
                return 0
            }
        }
    }
}
