// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan success

class A <: Throwable{}
class B <: Throwable{}
class C{}

extend C{
   public func foo(){throw A();1}
   func bar(){foo()}
}

func main(){
    try {
        C().foo();
        ()
    } catch (a:A) {
        print("success")
    }
    return 0
}