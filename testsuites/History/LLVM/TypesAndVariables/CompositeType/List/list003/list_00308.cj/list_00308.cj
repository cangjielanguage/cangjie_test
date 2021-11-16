// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

trait update{
    func test(a:This,b:List<Int64>):Int64
}

append<T> List<T> with update{
    func test(a:List<T>,b:List<Int64>):Int64{
        return b.size() - a.size()
    }
}

func main(): Int64 {
    var a = [1]
    var b = [1]
    return test(a,b)
}
