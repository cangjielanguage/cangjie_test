// EXEC: %compiler -frontend -dump-tokens %f 2>&1 | compare %f
// ASSERT: scan comment <driver_dumptokens_03.cj:2:1>
// ASSERT: scan comment <driver_dumptokens_03.cj:2:1>
// ASSERT: scan a identifier <driver_dumptokens_03.cj:10:5>
// ASSERT: scan colon <driver_dumptokens_03.cj:10:6>
// ASSERT: scan \\n newline <driver_dumptokens_03.cj:9:21>


func main(): Int64 {
var a: Int32 = 1
var b: Int32 = 2
if(a < b){
print("hello,worldn")
return 0
}
return 1
}
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
