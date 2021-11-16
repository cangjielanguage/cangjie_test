// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

//自增加表达式返回是unit类型
func main(): Int64 {
    return run()
}

func run(): Int64 {
    var a = 1
    if(a++ == ()){
        return 0
    }
    return 1
}