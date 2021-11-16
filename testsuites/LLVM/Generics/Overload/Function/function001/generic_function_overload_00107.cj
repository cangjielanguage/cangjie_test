// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

open class A<T>{
    func test(a:T){}
}

class B<T> <: A<T> {
    func test(a:T,b:T){}
}

func test(a:B<Int32>){}

func main():Int64{
    return 0
}