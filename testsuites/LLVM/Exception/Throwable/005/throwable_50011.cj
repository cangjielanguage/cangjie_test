// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args| compare %f
// ASSERT: scan success

class A <: Throwable{}

class B <: Throwable{}

internal open class C{
    public C(){
        var a : Int64 = if(true){throw A();1}else{0}
    }
}

class D <: C{
    init(){}
}

func main() {
    try{
        D();
        ()
    } catch (a:A) {
        print("success")
    }
    return 0
}
