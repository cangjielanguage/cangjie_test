// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
// ASSERT: regex-not Segementation

func main(): Int64 {
    case01()
    case02()
    case03()
    return 0
}

func case01(){ // EXPECTED: regex error.*?unable to infer function return type, please write it
    case02()
}

func case02(){ // EXPECTED: regex error.*?unable to infer function return type, please write it
    case01()
}

func case03(){ // EXPECTED: regex error.*?unable to infer function return type, please write it
    case03()
}
