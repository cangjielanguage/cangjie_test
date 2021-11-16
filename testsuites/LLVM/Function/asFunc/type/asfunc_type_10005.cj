// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class A<T>{
    private operator func ()(input:T){}
    func test(input:T){
        var a : A<T> = A<T>()
        a(input)
    }
}

func main(){
    var a : A<Int64> = A<Int64>()
    return 0
}