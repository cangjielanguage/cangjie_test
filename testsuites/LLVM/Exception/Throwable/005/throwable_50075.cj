// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan success
// ASSERT: scan exception_A
// ASSERT: regex init
// ASSERT: scan throwable_50075.cj:18
class A <: Throwable{
    init(a:String){super(a)}
}

class B {
    var a : A = A("exception_B")
}

func main() {
    var a : ?B = None
    try{
        throw a?.a??A("exception_A")
        ()
    } catch (a:A) {
        a.printStackTrace()
        print("success")
    }
    return 0
}
