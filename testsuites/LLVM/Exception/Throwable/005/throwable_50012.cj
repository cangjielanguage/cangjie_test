// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args| compare %f
// ASSERT: scan success

class A <: Throwable{}

class B <: Throwable{}

abstract class C{
    func c():Unit
}

class D <: C{
    func c(){throw A();()}
}

func main() {
    try{
        D().c();
        ()
    } catch (a:A) {
        a.printStackTrace()
        print("success")
    }
    return 0
}
