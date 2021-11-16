// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
interface A{
func i(){}
static func test(input !:Unit=this.i()){ // EXPECTED: regex non-static variable 'this' cannot be referenced from a static context
this.i() // EXPECTED: regex non-static variable 'this' cannot be referenced from a static context
}
}

class B{
func i(){}
static func test(input !:Unit=this.i()){ // EXPECTED: regex non-static variable 'this' cannot be referenced from a static context
this.i() // EXPECTED: regex non-static variable 'this' cannot be referenced from a static context
}
}

abstract class C{
func i(){}
func j():Unit
static func test(input !:Unit=this.i()){ // EXPECTED: regex non-static variable 'this' cannot be referenced from a static context
this.i() // EXPECTED: regex non-static variable 'this' cannot be referenced from a static context
}
static func test2(input !:Unit=this.i()){ // EXPECTED: regex non-static variable 'this' cannot be referenced from a static context
this.i() // EXPECTED: regex non-static variable 'this' cannot be referenced from a static context
}
}

func main(){
return 1
}
