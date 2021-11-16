// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

record X<T>{}

trait TR{
    func test(a:This,b:Int64):Int64
    func test(a:This,b:Int32):Int64
}

append<T> X<T> with TR{
    func test(a:X<T>,b:Int32):Int64{1}
    func test(a:X<T>,b:Int64):Int64{2}
}


func main():Int64{
    var res1 = X<Int64>().test(1)
    if (res1 != 2) {
        return 1
    }
    return 0
}