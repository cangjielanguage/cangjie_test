// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan success
// ASSERT: regex init
// ASSERT: scan test
// ASSERT: scan throwable_50074.cj:16
class A <: Throwable{
    init(a:String){super(a)}
}

class B <: Throwable{}

func main() {
    var a : ?A = None
    try{
        throw a??A("test")
        ()
    } catch (a:A) {
        a.printStackTrace()
        print("success")
    }
    return 0
}
