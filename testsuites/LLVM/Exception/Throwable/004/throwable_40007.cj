// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan success

class A <: Throwable{}
class C{}

extend C{
    prop var c : Int64{
        get(){
            throw A();
            1
        }
        set(v){
            throw A();
            ()
        }

    }
}

func main(){
    try {
        C().c;
        ()
    } catch (a:A) {
        print("success")
    } finally{
        return 0
    }
    return 5
}