// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    if ( A<Base>().a != 1 ){
        return 1
    }
    return 0
}

class A<T> where T<: Base {

}

extend A<T> where T <: Base{
    prop let a:Int64{
        get(){
            return 1
        }
    }
}

class Data <: Base{}
open class Base{}
