// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

enum TimeUnit {
    Year | Month | Day | Hour
}

trait Num {
    func plus(a: This, b: This): Int32
}

append TimeUnit with ord {
    func plus(a: TimeUnit, b: TimeUnit): Int32{
        return 2
    }
}

