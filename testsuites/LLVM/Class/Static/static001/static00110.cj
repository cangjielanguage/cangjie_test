// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
interface A{
let a = {  => }
static func i(input:()->Unit=a):Unit{input()}
static func test(input:(()->Unit)->Unit=i):Unit{input()}
}

class B{
static var a = {  => }
static func i(input:()->Unit=a):Unit{input()}
static func test(input:(()->Unit)->Unit=i):Unit{input()}
}

abstract class C{
static var a = {  => }
static func i(input:()->Unit=a):Unit{input()}
static func test(input:(()->Unit)->Unit=i):Unit{input()}
}

func main(){
return 0
}
