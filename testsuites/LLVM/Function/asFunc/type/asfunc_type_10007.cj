// ERRCHECK: %compiler %cmp_opt %f -o %output

open class A<T>{
    open operator func ()(input:T){1} // EXPECTED: regex modifiers 'open' and 'operator' are conflict in function declaration
}

class B<T> <: A<T>{
    override operator func ()(input:T){0} // EXPECTED: regex modifiers 'override' and 'operator' are conflict in function declaration
    func test(input:T){
        var b : B<T> = B<T>()
        b(input)
    }
}

func main(){
    var b : B<Int64> = B<Int64>()
    return b.test(1)
}