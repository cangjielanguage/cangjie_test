// EXEC: %compiler -frontend -help -dump-tokens %f 2>&1 | compare %f
// ASSERT: regex Usage:
// ASSERT: regex cjc -frontend \[option\] file...
// ASSERT: regex Options:
// ASSERT: regex -dump-tokens                Print all of the tokens in one compile unit
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

class Data {
var data: Int32 = 1
}

func run(): Int64 {
var value : Data = Data();
if (value.data != 1) {
return 1
}
return 0
}

func main(): Int64 {
return run()
}
