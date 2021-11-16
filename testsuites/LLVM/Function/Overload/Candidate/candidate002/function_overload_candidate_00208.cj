// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
class A{
    func test(a:Int8):Int64{return 1}
    func test(a:Int16):Int64{return 1}
}


func main():Int64{
    return 0
}