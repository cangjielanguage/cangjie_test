// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
interface X{
func i(){}
}

interface A <: X{
static func test(input !:Unit=super.i()){ // EXPECTED: regex non-static variable 'super' cannot be referenced from a static context
super.i() // EXPECTED: regex non-static variable 'super' cannot be referenced from a static context
}
}

open class Y{
func i(){}
}

class B <: Y{
static func test(input !:Unit=super.i()){ // EXPECTED: regex non-static variable 'super' cannot be referenced from a static context
super.i() // EXPECTED: regex non-static variable 'super' cannot be referenced from a static context
}
}

abstract class Z{
func i(){}
func j():Unit
}

abstract class C <: Z{
static func test(input !:Unit=super.i()){ // EXPECTED: regex non-static variable 'super' cannot be referenced from a static context
super.i() // EXPECTED: regex non-static variable 'super' cannot be referenced from a static context
}
static func test2(input !:Unit=super.i()){ // EXPECTED: regex non-static variable 'super' cannot be referenced from a static context
super.i() // EXPECTED: regex non-static variable 'super' cannot be referenced from a static context
}
}

func main(){
return 1
}
