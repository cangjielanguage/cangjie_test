// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

interface A<X>{
operator func !(a:A<X>):Bool{return false}
}


func main(){
return 1
}
