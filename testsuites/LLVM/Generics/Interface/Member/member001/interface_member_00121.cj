// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

interface I<Y>{
func t(a:Int64):Int64
}

class A <: I<Int32> { // EXPECTED: regex class 'A' missing abstract modifier or abstract function 't' should be implemented
}

func main(){
A()
return 0
}
