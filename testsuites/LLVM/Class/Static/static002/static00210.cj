// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace


class B{
var a = 1
static func test(input:Int64=this.a){ // EXPECTED: regex non-static variable 'this' cannot be referenced from a static context
this.a // EXPECTED: regex non-static variable 'this' cannot be referenced from a static context
}
}

abstract class C{
var a = 1
static func test(input:Int64=this.a){ // EXPECTED: regex non-static variable 'this' cannot be referenced from a static context
this.a // EXPECTED: regex non-static variable 'this' cannot be referenced from a static context
}
}

func main(){
return 1
}
