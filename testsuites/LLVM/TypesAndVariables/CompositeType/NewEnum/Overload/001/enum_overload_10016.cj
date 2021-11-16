// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


enum E{|e}


func main(): Int64 {
    func e(){}
    var a = e
    return 0
}
