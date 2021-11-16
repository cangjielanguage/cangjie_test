// EXEC: %compiler -help -frontend -dump-tokens %f 2>&1 | compare %f
// ASSERT: regex error.*?'-frontend' should be at the first place of all options
// ASSERT: regex error.*?'-dump-tokens' is a frontend option, require '-frontend' as the first option
// ASSERT: regex Usage:
// ASSERT: regex cjc \[option\] file...
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
