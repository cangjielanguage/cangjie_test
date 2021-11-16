// EXEC: %compiler %cmp_opt %n.cj -o  %output 2>&1 | compare %f


enum TimeUnit { Year(Int32) }

func run(): Int64 {
    var time = Yeal(2020) // EXPECTED: regex undeclared identifier 'Yeal'
    var res: Int32 = match (time) {
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
