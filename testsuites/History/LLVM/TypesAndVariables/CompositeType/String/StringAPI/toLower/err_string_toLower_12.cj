// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
// ASSERT: regex no matching function declaration for function call


func main(): Int64 {
var s:Int64 =45
if(s.toLower()!=""){
return 1
}
return 0
}
