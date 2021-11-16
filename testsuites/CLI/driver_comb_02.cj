// EXEC: %compiler %cmp_opt -enable-timer %f -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
// ASSERT: regex User Time
// ASSERT: regex-auto User+System
// ASSERT: regex Wall Time
// ASSERT: regex Description

// EXEC: %run %run_opt %output

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
