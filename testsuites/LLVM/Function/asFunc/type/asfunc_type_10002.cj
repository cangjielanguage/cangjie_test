// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class A<T>{
    operator func ()(input:T){}
}

interface B<T> {
    operator func ()(input:T){}
}

class C<T> <: B<T> {}

record D<T> {
    operator func ()(input:T){}
}

func test<T>(input:T){
    var a : A<T> = A<T>()
    var b : B<T> = C<T>()
    var c : D<T> = D<T>()
    a(input)
    b(input)
    c(input)
}

func main(){
    var a : A<Int64> = A<Int64>()
    var b : B<Int64> = C<Int64>()
    var c : D<Int64> = D<Int64>()
    a(1)
    b(1)
    c(1)
    return 0
}