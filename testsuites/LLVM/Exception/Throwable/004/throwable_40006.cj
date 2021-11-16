// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan success

class A <: Throwable{}
interface B{
    func f():Unit
}
class C{}

extend C <: B{
    func f():Unit{throw A();()}
}

func main(){
    try {
        C().f()
    } catch (a:A) {
        print("success")
    } finally{
        return 0
    }
    return 5
}