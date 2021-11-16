// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func test(): Option<Int32>{
    var optionalint1: Option<Int32> = Some<Int32>(100)
    optionalint1
}

func main(): Int64 {
    var pattern_res = match test(){
        case Some(x) => x
        case $None => 0
    }

    if pattern_res != 100 {
        return 1
    }

    return 0
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace