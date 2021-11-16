// ERRCHECK: %compiler %cmp_opt %f -o %output

abstract class A<T>{
    operator func ()(input:T):Int64 // EXPECTED: regex abstract function '\(\)' should not have modifiers
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