// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class A{
    let a = { input:List<Int64> => input}
}


func main(): Int64 {
    return A().a([1]).size() - 1
}
