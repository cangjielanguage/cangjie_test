// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan success

class A <: Throwable{}

class B <: Throwable{}

record C{
    prop var a : Int64{
        get (){throw A();1}
        set (v){throw A();()}
    }
}

func main() {
    try{
        var c = C()
        c.a;
        ()
    } catch (a:A) {
        a.printStackTrace()
        print("success")
    }
    return 0
}
