// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace
class VVV<T>{
    VVV(a:T,b:String,c!:Int32 =1,var d!:Int64){}
}
func main() {
    var aa =VVV(1, "b: String", c: 1, d: 1)
    0
}
