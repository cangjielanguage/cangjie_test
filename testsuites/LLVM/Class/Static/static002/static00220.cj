// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

abstract class A{
static func a():Unit // EXPECTED: regex function 'a' can not be abstract
}


func main(){
return 1
}
