// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
interface A{
static func test():Int64{1}
static func a():Int64{1}
static func b():Int64{1}
}

interface X <: A{
static override func a():Int64{2} // EXPECTED: regex 'override' modifier is illegal for function declaration in interface body
override static func a():Int64{2} // EXPECTED: regex 'override' modifier is illegal for function declaration in interface body
}


open class B{
func test():Int64{1}
}

class Y <: B{
override static func test():Int64{3} // EXPECTED: regex modifiers 'static' and 'override' are conflict in function declaration
}

abstract class C{
static func test():Int64{1}
}

abstract class Z <: C{
static override func test():Int64{4} // EXPECTED: regex modifiers 'static' and 'override' are conflict in function declaration
}

func main(){
return 1
}
