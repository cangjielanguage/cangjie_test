// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan top

func test<T>(input:T){print("top")}

open class A<T>{
    func test(a:T){print("inside")}
    var i : T
    init(a: T) { this.i = a }
    func b(){
        test<Int64>(1)
    }
}


func main():Int64{
    A<Int64>(0).b()
    return 0
}