// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


enum E{|e}

class A{
    func test(){e}
    static func e(){}
}


func main(): Int64 {
    A().test()()
    return 0
}
