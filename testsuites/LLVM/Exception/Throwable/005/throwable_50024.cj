// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan success

class A <: Throwable{}

class B <: Throwable{}

class C{
    func test(x:Bool){
        if (x){
            throw A();
            ()
        } else {
            ()
        }
    }
}

extend C{
    func foo(){this.test(true)}
}

func main() {
    try{
        C().foo()
    } catch (a:A) {
        a.printStackTrace()
        print("success")
    }
    return 0
}
