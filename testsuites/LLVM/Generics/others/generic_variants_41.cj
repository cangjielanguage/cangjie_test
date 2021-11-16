// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    if ( C<B>().a != 1 ){
        return 1
    }
    return 0
}

open class A<T> {
}

class B <: A<B>{

}

record C<T> where T <: A<T>{
    prop let a:Int64{
        get(){
            return 1
        }
    }
}
