// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// EXEC: %run %run_opt %output %run_args
// ASSERT: regex-not unimplemented generate


trait C{
    func asFunc(input:This):Int64
}

append<T> T with C{
    func asFunc(input:T):Int64{0}
}

func test<T>(input:T){
    var a : T*T = (input,input)
    return a()
}

func main(): Int64 {
    return test<Int64>(1)
}
