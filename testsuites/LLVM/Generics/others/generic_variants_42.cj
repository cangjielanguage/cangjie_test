// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    return 0
}

open class A<T> {
}

record C<T> where T <: A<T>{
    prop let a:Int64{
        get(){
            return 1
        }
    }
}
