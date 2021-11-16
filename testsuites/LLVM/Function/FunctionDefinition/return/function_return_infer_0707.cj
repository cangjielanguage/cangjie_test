// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    if (case01() != () ) {
        return 1
    }
    if (case02() != () ) {
        return 2
    }
    return 0
}

func case01(){
    func foo(){}
}

func case02(){
    var a: Int32
}