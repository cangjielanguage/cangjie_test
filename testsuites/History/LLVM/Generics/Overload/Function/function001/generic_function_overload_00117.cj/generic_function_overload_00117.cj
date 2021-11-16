// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan trait

trait TR{func test(a:This):Unit}

append Int64 with TR{func test(a:Int64){print("trait")}}

func test<T>(input:T){print("top")}

open class A<T>{
    func test(a:T){print("inside")}
    var i : T
    init(a: T) { this.i = a }
    func b(){
        test(i)
    }
}


func main():Int64{
    test<Int64>(1)
    return 0
}