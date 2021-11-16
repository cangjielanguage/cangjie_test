// EXEC: %compiler -frontend %cmp_opt 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
// ASSERT: regex error.*?expected at least one source code file when compiling source code

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
