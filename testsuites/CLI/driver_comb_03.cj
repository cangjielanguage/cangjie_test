// EXEC: %compiler -c -verbose %f 2>&1 | compare %f
// ASSERT: regex Cangjie Compiler: .*? \(.*? \d{4}-\d{2}-\d{2}\)
// ASSERT: regex ".*?\" -frontend -c -verbose driver_comb_03\.cj
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
// EXEC: %ls %n.o

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
