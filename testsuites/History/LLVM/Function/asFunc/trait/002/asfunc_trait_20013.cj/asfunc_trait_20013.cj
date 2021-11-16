// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args



trait C{
    func asFunc(input:This):Int64
}

append Option<Int64> with C{
    func asFunc(input:Option<Int64>):Int64{0}
}

func test<T>(input:T){
    var a : Option<Int64> = Some<Int64>(1)
    return a()
}

func main(): Int64 {
    return test<Int64>(1)
}
