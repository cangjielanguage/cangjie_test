// EXEC: %compiler -backend=llvm %f 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
// ASSERT: regex error.*?invalid value: 'driver_backend_06.cj'
// ASSERT: regex Usage:
// ASSERT: regex-auto cjc [option] file...

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

