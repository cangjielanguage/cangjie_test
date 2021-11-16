// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    if ( C<A<String>,String>().a != 1){
        return 1
    }
    return 0
}

open class A<T> {
    static var a = 1
}

record C<T,V> where T <: A<V> , V <: String{
    prop let a:Int64{
        get(){
            return 1
        }
    }
}
