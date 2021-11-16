// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

func getHeight(height: Int64): Int64{
return height*2
}

class Data<T> {
let width: T

init(x: T){
width = T // EXPECTED: regex expected member name or constructor call after 'T' type name
}
}

func run(): Int32 {
let data: Data<(Int64)->Int64> = Data<(Int64)->Int64>(getHeight)
var res = data.width(5)
if (res == 10) {
return 0
}
return 1
}

func main(): Int32 {
return run()
}

