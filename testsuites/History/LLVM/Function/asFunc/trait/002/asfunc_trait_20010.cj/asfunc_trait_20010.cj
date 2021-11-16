// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

enum A<T>{a}

trait C{
    func asFunc(input:This):Int64
}

append A<Int64> with C{
    func asFunc(input:A<Int64>):Int64{0}
}

func test<T>(input:T){
    var a : A<Int64> = A<Int64>.a
    return a()
}

func main(): Int64 {
    return test<Int64>(1)
}
