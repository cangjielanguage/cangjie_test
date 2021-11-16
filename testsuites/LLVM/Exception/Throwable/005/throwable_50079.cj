// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan success
// ASSERT: regex init
// ASSERT: scan exception_B

class A <: Throwable{
    init(a:String){super(a)}
}

class B {
    var a : A = A("exception_B")
}

func test():Result<B>{
    var a : Result<B> = Ok(B())
    try{
        throw a!.a;
        ()
    } catch (a:A) {
        a.printStackTrace()
        print("success")
    }
    return a
}

func main() {
    test()
    return 0
}
