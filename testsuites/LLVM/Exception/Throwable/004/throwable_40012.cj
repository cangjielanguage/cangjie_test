// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan success

class A <: Throwable{}
class B <: Throwable{}
record C{
    var i = 0
}

extend C{
   mut func f(){throw A();i+=1}
}

func main(){
    try {
        C().f();
        ()
    } catch (a:A) {
        print("success")
    }
    return 0
}