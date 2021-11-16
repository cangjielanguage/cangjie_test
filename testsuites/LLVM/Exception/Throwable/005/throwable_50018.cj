// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan success

class A <: Throwable{}

class B <: Throwable{}

open class C{
    protected var a : Int64 = if (true) {throw A();1} else {2}

}

class D <: C{
    init(){
        var b = super.a
    }
}

func main() {
    try{
        D();
        ()
    } catch (a:A) {
        a.printStackTrace()
        print("success")
    }
    return 0
}
