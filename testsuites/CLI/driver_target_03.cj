// EXEC: %compiler -no-prelude 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
// ASSERT: regex error.*?expected at least one source code file when compiling source code


func run(): Int64 {
var value : Int32 = 1
if (value != 1) {
return 1
}
return 0
}

func main(): Int64 {
return run()
}
