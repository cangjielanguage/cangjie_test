// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

trait update<T>{
    func test(a:This, b:List<T>):List<T>
}

append List<Int64> with update<Int64>{
    func test(a:List<Int64>, b:List<Int64>){
        return b
    }
}

func main(): Int64 {
    return test([1],[2])[0] - 2
}
