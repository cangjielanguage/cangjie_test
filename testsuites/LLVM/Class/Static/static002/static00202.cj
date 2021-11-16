// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

class B{
var i : Int64 = 1
static func test(){i}// EXPECTED:regex 'i' is non-static member, cannot be accessed by static function 'test'
}

abstract class C{
var i : Int64 = 1
static func test(){i}// EXPECTED:regex 'i' is non-static member, cannot be accessed by static function 'test'
}

func main(){
B.test()
C.test()
return 1
}
