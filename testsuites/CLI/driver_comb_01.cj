// EXEC: %compiler -frontend %cmp_opt -dump-tokens %f 2>&1| compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
// ASSERT: regex-auto comment <driver_comb_01.cj
// ASSERT: regex-auto Data identifier <driver_comb_01.cj
// ASSERT: regex-auto { l_curl <driver_comb_01.cj

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
