// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func a(input:List<Int64>):List<Int64>{input}
func b<T>(input:List<T>):List<T>{input}


func main(): Int64 {
    return a([1]).size() + b<Int64>([1]).size() - 2
}
