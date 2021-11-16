// EXEC: %compiler -backend js -backend-options="-N" -verbose %f -o %n.js 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
// ASSERT: regex Cangjie Compiler: .*? \(.*? \d{4}-\d{2}-\d{2}\)

func main(): Int64 {
return run()
}

func run(): Int64 {
var i: Int32 = 3
var str: String = i.toString()
if (str == "3") {
return 0
}
return 1
}

