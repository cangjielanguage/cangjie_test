// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
// ASSERT: regex no matching function declaration for function call

func main(): Int64 {
var s:String ="Test String"
if(s.get(true)!='T'){
return 1
}

return 0
}
