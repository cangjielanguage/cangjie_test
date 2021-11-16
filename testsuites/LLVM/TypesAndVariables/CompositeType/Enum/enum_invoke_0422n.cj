// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f


enum TimeUnit { Year(Int32) }

func run(): Int64 {
    let time = TimeUnit.Year(2020)
    time = TimeUnit.Year(20) // EXPECTED: regex is an initialized 'let' constant
    let res: Int32 = match (time) {
        case Year(x) => x
    }

    if (res == 2020) {
        return 0
    } else {
        return 1
    }
}

func main(): Int64 {
    return run()
}
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
