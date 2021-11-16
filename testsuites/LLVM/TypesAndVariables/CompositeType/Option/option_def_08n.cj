// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

func run(): Int64 {
    var opt: Option<Int32> = Option<Int32>.Other(3) // EXPECTED: regex 'Other' is not a member of enum 'Option'
    var res: Int32 = match (opt) {
        case Some(x) => x
        case $None => 0
    }
    if (res == 0){
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}

