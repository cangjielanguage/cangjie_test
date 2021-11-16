// EXEC:  %compiler -b llvm %f 2>&1 | compare %f
// ASSERT: regex error.*?invalid option.*?'-b'
// ASSERT: regex Usage:
// ASSERT: regex cjc \[option\] file...
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

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

