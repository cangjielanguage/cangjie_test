// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan success

class A <: Throwable{}

class B <: Throwable{}

func test(a:(Int64)->Int64){a(1)}

func main() {
    try{
        test{x:Int64=>throw A();1}
        ()
    } catch (a:A) {
        a.printStackTrace()
        print("success")
    }
    return 0
}
