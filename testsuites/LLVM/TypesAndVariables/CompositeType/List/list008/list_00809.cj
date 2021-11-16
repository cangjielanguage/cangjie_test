// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

record A<T>{
    var a : List<T>
    init(input:T){
        a = [input]
    }
}

func main(): Int64 {
    return A<Int64>(1).a.size() - 1
}
