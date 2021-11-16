// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func test<T>(){
    var a : Option<Int64> = 1
}

func main(): Int64 {
     test<Bool>()
     return 0
}
