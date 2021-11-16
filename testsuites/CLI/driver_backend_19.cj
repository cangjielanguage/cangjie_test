// EXEC: %compiler -backend-options= %f 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
// ASSERT: regex warning.*?option '-backend-options' requires some values, format: option=value or option="v1, v2..."

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

