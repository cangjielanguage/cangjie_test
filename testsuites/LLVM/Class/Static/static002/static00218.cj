// EXEC: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

interface A{
static func a():Unit
}


func main(){
return 1
}
