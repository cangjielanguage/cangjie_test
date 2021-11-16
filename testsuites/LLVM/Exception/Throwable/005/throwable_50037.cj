// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan success

class A <: Throwable{}

class B <: Throwable{}

open class C{
    func test(x!:Bool=if(true){throw A();true}else{true}){}
}

class D <: C{
    func foo(x:Bool){super.test()}
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
