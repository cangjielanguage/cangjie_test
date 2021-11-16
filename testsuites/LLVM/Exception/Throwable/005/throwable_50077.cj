// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan success
// ASSERT: regex init
// ASSERT: scan exception_A
// ASSERT: scan throwable_50077.cj:14
class A <: Throwable{
    init(a:String){super(a)}
    operator func ()(){this}
}

func main() {
    try{
        throw A("exception_A")()
    } catch (a:A) {
        a.printStackTrace()
        print("success")
    }
    return 0
}
