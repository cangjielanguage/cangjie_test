// DEPENDENCE: ../src ../cfg-ast
// EXEC: %compiler %cmp_opt -c src/pkga/pkga.cj -o pkga.%middle
// EXEC: %compiler %cmp_opt %f pkga.%middle   -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

import pkga.TimeUnit // EXPECTED: regex 'TimeUnit' is not accessible in package 'pkga'

func run(): Int64 {
    var time = TimeUnit<Int32>.Hour(3)
    return 0
}

func main(): Int64 {
    return run()
}
