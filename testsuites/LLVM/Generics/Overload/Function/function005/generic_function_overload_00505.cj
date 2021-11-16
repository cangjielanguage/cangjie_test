// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

interface A<T>{
static func test(a:Int64){return 1}
static func test(a:T){return 2}
}

class B<T>{
static func test(a:Int64){return 1}
static func test(a:T){return 2}
}

record C<T>{
static func test(a:Int64){return 1}
static func test(a:T){return 2}
}

func main():Int64{
var res1 = A<Int16>.test(Int32(1)) // EXPECTED: regex no matching function declaration for function call
if (res1 != 2) {
return 1
}
var res2 = B<Int16>.test(Int32(1)) // EXPECTED: regex no matching function declaration for function call
if (res2 != 2) {
return 1
}
var res3 = B<Int16>.test(Int32(1)) // EXPECTED: regex no matching function declaration for function call
if (res3 != 2) {
return 1
}
return 0
}
