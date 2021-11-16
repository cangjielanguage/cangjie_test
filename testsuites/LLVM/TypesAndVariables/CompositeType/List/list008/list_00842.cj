// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

record A<T>{
    static let a : (List<T>) -> List<T> = { input:List<T> => input}
}


func main(): Int64 {
    return A<Int64>.a([1]).size() - 1
}
