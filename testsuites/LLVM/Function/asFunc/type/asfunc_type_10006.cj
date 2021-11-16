// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

open class A<T>{
    protected operator func ()(input:T){}

}

class B<T> <: A<T>{
    func test(input:T){
        var b : B<T> = B<T>()
        b(input)
    }
}

func main(){
    var b : B<Int64> = B<Int64>()
    b.test(1)
    return 0
}