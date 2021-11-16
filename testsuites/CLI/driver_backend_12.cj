// EXEC: %compiler -backend-options="-Helloworld" %f 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
// ASSERT: regex (clang.*?error: unknown argument)|(unrecognized option '-Helloworld')

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

