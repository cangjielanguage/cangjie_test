// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan inside

trait TR{func test(a:This):Unit}

append Int64 with TR{func test(a:Int64){print("trait")}}

open class A<T>{
    func test(a:T){print("inside")}
    var i : T
    init(a : T) { this.i = a }
    func b(){
        test(i)
    }
}


func main():Int64{
    A<Int64>(0).b()
    return 0
}