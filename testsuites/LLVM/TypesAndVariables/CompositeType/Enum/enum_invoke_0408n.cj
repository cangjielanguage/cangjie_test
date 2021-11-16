// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

enum TimeUnit { Year(Int32) }
enum TimeUnit2 { Year(Int64) }

func run(): Int64 {
    var time = Year(2020) // EXPECTED: regex find multiple constructor 'Year' of enum declaration
    var res: Int64 = match (time) {
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
