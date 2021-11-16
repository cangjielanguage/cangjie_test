// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func test(a!:List<Int64>){
    var x : Int64 = 0
    return a[x]
}

func main(): Int64 {
    var x : List<Int64> = [0]
    var y : Int64 = 0
    return test(a:x) + test(a:[y])
}
