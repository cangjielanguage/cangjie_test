// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func test<T>(x : ?T , y : T){
    var a : T = x ?? y
    return a
}

func main(): Int64 {
    return test<Int64>(0,1)
}
