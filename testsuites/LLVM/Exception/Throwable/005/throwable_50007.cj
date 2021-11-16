// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args| compare %f
// ASSERT: scan success

class A <: Throwable{}

class B <: Throwable{}

class C{
    private init(){
        var a : Int64 = if(true){throw A();1}else{0}
    }
    init(a:Int64){
        this()
    }
}

func main() {
    try{
        C(1);
        ()
    } catch (a:A) {
        print("success")
    }
    return 0
}
