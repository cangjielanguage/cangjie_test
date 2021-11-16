// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

interface A<T>{
    operator func ()(input:T):Int64{1}
}

interface B<T> <: A<T>{
    operator func ()(input:T):Int64{0}
}

class C<T> <: B<T>{
    func test(input:T){
        var b : B<T> = C<T>()
        b(input)
    }
}

func main(){
    var b : C<Int64> = C<Int64>()
    return b.test(1)
}
