// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

enum TimeUnit { Year(Int32) }

func run(): Int64 {
    var time = .Year(2020) 
 in(): Int64 {
    return  time {
        case Year(x) => x
    }

    if ( res == 2020 ) {
    return 0
    } else {
        return 1
    }
}

fuc main(): Int64 {
    return rn()
}
