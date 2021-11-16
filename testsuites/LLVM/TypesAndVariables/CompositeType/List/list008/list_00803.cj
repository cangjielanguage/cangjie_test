// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func foo(): Int64 {
    let a = [1,2,3]
    var b = [1,2,3]
    return a.size() + b.size() - 6
}

func bar<T>(input:T): Int64{
    let a = [input]
    var b = [input]
    return a.size() + b.size() - 2
}

func main(): Int64 {
    return foo() + bar(1)
}
