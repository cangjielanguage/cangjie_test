// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

interface A<T>{}

interface B <: A<Int32> & A<Int64>{}

class C <: B{}


func main(){
    var b : B = C()
    return 0
}