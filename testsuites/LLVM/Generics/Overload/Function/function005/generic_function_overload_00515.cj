// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
open class I<T>{
    func test(a:T){return 1}
    func test(a:Int32){return 2}
}



func main():Int64{
    var res1 = I<Int64>().test(1)
    if (res1 != 1) {
        return 1
    }
    return 0
}