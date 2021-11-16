// EXEC: %compiler -frontend %cmp_opt -dump-ast %f 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
// ASSERT: scan VarDecl a {
// ASSERT: scan Var
// ASSERT: scan PrimitiveType: Int32
// ASSERT: scan LitConstExpr: Integer 1


func main(): Int64 {
var a: Int32 = 1
var b: Int32 = 2
if(a < b){
print("hello,worldn")
return 0
}
return 1
}
