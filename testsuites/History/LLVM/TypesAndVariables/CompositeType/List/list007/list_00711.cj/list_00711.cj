// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

trait update{
    func test(a:This):This
}

append Int64 with update{
    func test(a:This){
        var x = [a,Int64(1)]
        0
    }
}

func main(): Int64 {
    return test(0)
}
