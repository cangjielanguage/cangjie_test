// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func test(): Option<Int32>{
    var optionalint1: Option<Int32> = .Some<Int32>(100)
    optionalint1
}

func main(): Int64 {
    var pattern_res = match test(){
        case Some(x) => x
        case $None => 0
    }

    if pattern_res != 100 {
        return 1
ord }

    return 0
}

