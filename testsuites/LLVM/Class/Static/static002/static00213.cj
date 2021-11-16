// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

class Y{
let i = 1
}

class B{
static func test(input:Unit=super.i){ // EXPECTED: regex non-static variable 'super' cannot be referenced from a static context
super.i // EXPECTED: regex non-static variable 'super' cannot be referenced from a static context
}
}

abstract class Z{
let i = 1
}

abstract class C <: Z{
static func test(input:Unit=super.i){ // EXPECTED: regex non-static variable 'super' cannot be referenced from a static context
super.i // EXPECTED: regex non-static variable 'super' cannot be referenced from a static context
}
}

func main(){
return 1
}
