// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

trait update{
    func test(a:This, b:List<Int64>):List<Int64>
}

append List<Int64> with update{
    func test(a:List<Int64>, b:List<Int64>){
        return b
    }
}

func main(): Int64 {
    return test([1],[2])[0] - 2
}
