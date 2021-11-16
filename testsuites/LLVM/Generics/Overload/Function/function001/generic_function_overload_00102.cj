// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
class A<T>{
    func test(a:T){print("A_first")}
    func test(a:Int64){print("A_second")}
}

func test(a:A<Int32>){}

func main():Int64{
    test(A<Int32>())
    return 0
}