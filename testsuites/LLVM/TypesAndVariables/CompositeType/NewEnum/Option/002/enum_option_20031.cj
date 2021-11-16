// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func test<T>(input:T){
    var x : ?T = input
}

func main(): Int64 {
    return 0
}
