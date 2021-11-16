// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

trait update<T>{
    func test(a:This, b:List<T>):List<T>
}

append<T> List<Int64> with update<T>{
    func test(a:List<Int64>, b:List<T>){
        return b
    }
}

func main(): Int64 {
    return test([1],[2])[0] - 2
}
