// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args



func test(): Int64 {
    var a = [if (true) {1}else{2}]
    return a.size() - 1
}

func main(): Int64 {
    return test()
}
