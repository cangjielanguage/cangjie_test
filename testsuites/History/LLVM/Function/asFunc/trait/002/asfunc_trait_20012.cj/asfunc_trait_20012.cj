// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args



trait C{
    func asFunc(input:This):Int64
}

append<T> Option<T> with C{
    func asFunc(input:Option<T>):Int64{0}
}

func test<T>(input:T){
    var a : Option<T> = None<T>
    return a()
}

func main(): Int64 {
    return test<Int64>(1)
}
