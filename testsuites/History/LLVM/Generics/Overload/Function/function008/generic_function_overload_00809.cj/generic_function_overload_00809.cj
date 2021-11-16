// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func test <T>(a:T){return 1}
trait TR{func test(a:This):Int64}
append Int32 with TR{func test(a:Int32){return 2}}

func main():Int64{
    var I = test(1)
    if (I != 2) {
        return 1
    }
    return 0
}