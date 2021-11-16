// EXEC: %compiler -backend js -backend-options="--print" %f -o %n.js 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
// ASSERT: regex xxx 后端选项对js后端无意义

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


