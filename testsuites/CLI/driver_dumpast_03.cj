// EXEC: %compiler -frontend %cmp_opt -dump-ast %f 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
// ASSERT: scan Package default {
// ASSERT: scan File driver_dumpast_03.cj {

File driver_dumpast_03.cj {
+ # no package
+ >ImportPackage: core.*

func main(x!:Int32=1): Int64 {
var a: Int32 = 1;
if(a < b){
print("hello,worldn")
return 0
}
return 1
}
