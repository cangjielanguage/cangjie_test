// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
class A{
    func test(a:Int8):Int64{return 1}
    var test : Int8->Int64 = { a:Int8 => return 1} // EXPECTED: regex redefinition of declaration 'test'
}


func main():Int64{
    return 1
}