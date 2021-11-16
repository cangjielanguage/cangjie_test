// EXEC: %compiler -backend-options='-L/root/code/Char/output/bin/../lib' -verbose %f 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
// ASSERT: regex (".*?clang".*?-L/root/code/Char/output/bin/../lib.*?)|(".*?ld".*?-L/root/code/Char/output/bin/../lib.*?)


func main(): Int64 {
return run()
}

func run(): Int64 {
var b:Base = Base()
return 0
}


class Base{
var a: Int32 = 3
}

