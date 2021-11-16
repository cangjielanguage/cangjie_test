// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
    return 0
}

class A<T> {}

extend A<T> where T <: String {
    prop let a:Int64{
        get(){
            return 1
        }
    }
}
