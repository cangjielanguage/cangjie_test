// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


enum E{|e}

class A{
    func e(){}
    func test(){var a = e}
}


func main(): Int64 {
    return 0
}
