// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
    if ( A<String,String>().a != 1 ){
        return 1
    }
    if ( A<Data,Data>().a != 1 ){
        return 1
    }
    if ( A<Base,Base>().a != 1 ){
        return 1
    }
    if ( A<Data,Base>().a != 1 ){
        return 1
    }
    return 0
}

class A<T,V> where T<:V {
    prop let a:Int64{
        get(){
            return 1
        }
    }
}

class Data <: Base{}
open class Base{}