// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

enum TimeUnit1 {
Hour
| Year
}
enum TimeUnit2 {
Month
}

func run(): Int64 {
var time = TimeUnit2.Month
var res: Int32 = match (time) {
case Month(Hour) => 2020 // EXPECTED: regex enum pattern's parameters size is wrong
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
