// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan success

class A <: Throwable{}

class B <: Throwable{}

interface C{
    prop var a : Int64{
        get (){throw A();1}
        set (v){throw A();()}
    }
}

class D <: C{}

func main() {
    try{
        D().a = 1;
        ()
    } catch (a:A) {
        a.printStackTrace()
        print("success")
    }
    return 0
}
