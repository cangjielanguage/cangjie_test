// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

interface A<T>{
    let a = (input:List<T>):List<T> => {input}
}


func main(): Int64 {
    A<Int64>.a([1])
    return 0
}
