// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
interface A{
func i(){}
static func test(){i()}// EXPECTED:regex 'i' is non-static member, cannot be accessed by static function 'test'
}

class B{
func i(){}
static func test(){i()}// EXPECTED:regex 'i' is non-static member, cannot be accessed by static function 'test'

}

abstract class C{
func i(){}
func j():Unit
static func test(a:Int32){j()}// EXPECTED:regex 'j' is non-static member, cannot be accessed by static function 'test'
static func test(){i()}// EXPECTED:regex 'i' is non-static member, cannot be accessed by static function 'test'
}

func main(){
A.test()
B.test()
C.test()
return 1
}
