// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan success

class A <: Throwable{}

class B <: Throwable{}

enum C{
    e
    prop let a : Int64{
        get (){throw A();1}
    }
}

func main() {
    try{
        var c = C.e.a;
        ()
    } catch (a:A) {
        a.printStackTrace()
        print("success")
    }
    return 0
}
