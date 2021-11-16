// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func run(): Int64 {
    var opt1: Option<Int32> = Option<Int32>.Some(20)
    var opt2: Option<Int32> = Option<Int32>.Some(20)
    if (opt1 != opt2) {  // EXPECTED: regex invalid binary operator '!=' on type 'Enum-Option<Int32>' and 'Enum-Option<Int32>'
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}

