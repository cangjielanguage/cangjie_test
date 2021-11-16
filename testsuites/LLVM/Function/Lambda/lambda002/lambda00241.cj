// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func test(): Int64 {
    let functionDefinition = {  =>
    func func_in_lambda():Unit{return}
    }
    return 0
}

func main(): Int64 {
    return test()
}
