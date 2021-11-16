// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class A<T> <: Exception{}

func test<T>(){
    try { throw A<Int64>()} catch (_:A<T>) {}finally{}
}

func main(){
    test<Int64>()
    return 0
}