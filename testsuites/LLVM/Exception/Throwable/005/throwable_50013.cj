// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args| compare %f
// ASSERT: scan success

class A<T> <: Throwable{}

class B<T> <: Throwable{}

open class C<T>{
    protected init(){
        var a : Int64 = if(true){throw A<T>();1}else{0}
    }
}

class D<T> <: C<T>{
    init(){}
}

func main() {
    try{
        D<Int64>();
        ()
    } catch (a:A<Int64>) {
        print("success")
    }
    return 0
}
