// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan success

class A <: Throwable{}

class B <: Throwable{}

open class C{
    protected func test(x:Bool){
        if (x){
            throw A();
            ()
        } else {
            ()
        }
    }
}

class D <: C{
    func foo(x:Bool){super.test(x)}
}


func main() {
    try{
        D().foo(true)
    } catch (a:A) {
        a.printStackTrace()
        print("success")
    }
    return 0
}
