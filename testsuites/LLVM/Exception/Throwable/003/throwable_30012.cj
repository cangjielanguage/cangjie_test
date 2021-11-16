// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan success

class A <: Throwable{}

func foo(){
    func bar(){
        throw A()
    }
    bar()
}

func main() {
    try{
        foo()
    } catch (a:A) {
        print("success")
        return 0
    }
    return 5
}
