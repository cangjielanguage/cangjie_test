// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

interface A<T>{
    operator func ()(input:T):Int64
}

class B<T> <: A<T>{
    operator func ()(input:T){0}
    func test(input:T){
        var b : B<T> = B<T>()
        b(input)
    }
}

func main(){
    var b : B<Int64> = B<Int64>()
    return b.test(1)
}