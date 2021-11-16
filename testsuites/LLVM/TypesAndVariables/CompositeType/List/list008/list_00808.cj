// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

record A{
    var a : List<Int64>
    init(input:Int64){
        a = [input]
    }
}

func main(): Int64 {
    return A(1).a.size() - 1
}
