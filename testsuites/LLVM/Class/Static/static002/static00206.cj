// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

class B{
init(){}
static func test(){this()}// EXPECTED:regex non-static variable 'this' cannot be referenced from a static context

}

abstract class C{
init(){}
static func test(){this()}// EXPECTED:regex non-static variable 'this' cannot be referenced from a static context
}

func main(){
B.test()
C.test()
return 1
}
