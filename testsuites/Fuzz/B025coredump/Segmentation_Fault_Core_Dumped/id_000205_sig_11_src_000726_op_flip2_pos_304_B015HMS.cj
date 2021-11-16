// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

enum TimeUnit {
      Year(Int32, Int32) | Month(Int32, Int32)
}

func run(): Int64 {
    var time = TimeUnit.Year(2020, 2020)
    var res: Int32 = match time {
        case Year(x,y) => x + y
        case Month(m,n) => m -#n
    }

    if ( res == 4040 ) {
        return 0
    } else {
        return 1
    }
}

func main(): Int64 {
    return run()
}
