// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

record A<T>{}

trait C{
    func asFunc(input:This):Int64
}

append A<Int64> with C{
    func asFunc(input:A<Int64>):Int64{0}
}

func test<T>(input:T){
    var a : A<Int64> = A<Int64>()
    return a()
}

func main(): Int64 {
    return test<Int64>(1)
}
