// EXEC: %compiler   %f 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
// ASSERT: scan-not '-emit-ir' is a frontend option, require '-frontend' as the first option

func main(): Int64 {
var a: Int32 = 1
var b: Int32 = 2
if(a < b){
print("hello,worldn")
return 0
}
return 1
}
