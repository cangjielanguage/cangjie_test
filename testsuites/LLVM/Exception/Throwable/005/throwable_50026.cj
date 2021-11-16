// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan success

class A <: Throwable{}

class B <: Throwable{}

class C{
    static func test<T>(x:Bool){
        if (x){
            throw A();
            ()
        } else {
            ()
        }
    }
}


func main() {
    try{
        C.test<Int64>(true)
    } catch (a:A) {
        a.printStackTrace()
        print("success")
    }
    return 0
}
