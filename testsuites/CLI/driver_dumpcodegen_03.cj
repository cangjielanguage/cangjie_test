// EXEC: %compiler -frontend %cmp_opt -dump-ir %f 2>&1 |compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
// ASSERT: regex error.*?undeclared identifier 'b'

func main(): Int64 {
var a: Int32 = 1
var c: Int32 = 2
if(a < b){
print("hello,worldn")
return 0
}
return 1
}
