// EXEC: %compiler %cmp_opt %f 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
// ASSERT: regex the number '9223372036854775808' exceeds the value range of type 'Int64'

func main(): Int64 {
var s:String ="Test String"
if(s.charAt(9223372036854775808) != 'T'){
return 1
}

return 0
}
