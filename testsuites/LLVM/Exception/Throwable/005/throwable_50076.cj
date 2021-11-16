// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan success
// ASSERT: regex init
// ASSERT: scan exception_A
// ASSERT: scan throwable_50076.cj:15
class A <: Throwable{
    init(a:String){super(a)}
}

func foo(a:Int64){A("exception_A")}

func main() {
    try{
        throw 1|>foo
        ()
    } catch (a:A) {
        a.printStackTrace()
        print("success")
    }
    return 0
}
