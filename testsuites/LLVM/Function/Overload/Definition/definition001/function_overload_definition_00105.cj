// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func test1(a:Int16):Int64{return 1}
func test2(a:Int16):Int64{return 2}


func main():Int64{
    func test3(a:Int16):Int64{return 3}
    func test4(a:Int16):Int64{return 4}
    return test1(Int16(1))
        + test2(Int16(1))
        + test3(Int16(1))
        + test4(Int16(1)) - 10
}
