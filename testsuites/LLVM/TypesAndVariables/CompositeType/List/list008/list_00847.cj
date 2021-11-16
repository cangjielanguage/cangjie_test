// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

record A<T>{
    static func a(input:List<T>):List<T>{input}
}


func main(): Int64 {
    return A<Int64>.a([1]).size() - 1
}
