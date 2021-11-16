// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func test<T>(i:?T){
    var j : ?T = i
    func foo(x:?T){}
    foo(i)
}

func main(): Int64 {
    test<Int64>(0)
    return 0
}
