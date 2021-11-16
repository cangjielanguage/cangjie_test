// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64 {
    foo1()
    return 0
}

func foo1(){
    let score = 80
    // BUG,在match的左花括号之后加个备注就报错
    var result: String = match { // xxx
        case score < 60 => "fail"
        case score >= 60 => "fail"
        case _ => "NoDefine"
    }
}
