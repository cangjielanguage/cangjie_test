// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
// ASSERT: regex empty character is not allowed

func run(): Int64 {

var c1: RefArray<Char> = RefArray<Char>([''])

var s11: String = String(c1).substring(0)

print("s11=" + s11 + "n")

return 0
}

func main(): Int64 {
return run()
}
