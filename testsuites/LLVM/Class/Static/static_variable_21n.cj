// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace


class Data {
static var a: Int32 // EXPECTED: regex static variable 'a' needs to be initialized when declaring
}

func run(): Int64 {
if (Data.a == 0) {
return 0
}
return 1
}

func main(): Int64 {
return run()
}
