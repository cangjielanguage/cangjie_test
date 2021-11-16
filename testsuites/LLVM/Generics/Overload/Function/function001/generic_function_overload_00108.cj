// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

open class A<X,Y>{
    func test(a:X,b:Y){}
    func test(a:Y,b:X){}
}

func test(a:A<Int32,Int64>){}

func main():Int64{
    return 0
}