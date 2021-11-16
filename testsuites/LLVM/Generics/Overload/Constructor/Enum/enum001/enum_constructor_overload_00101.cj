// EXEC-PIPE-1: %compiler %frontend %typecheck %cmp_opt %f 2>&1 | compare %f

enum A{
    a |
    a(Int64)|
    a(Int64,Int64)
}

func main():Int64{
    var i = A.a // ASSERT: regex-auto reference to overloaded function 'a' could not be resolved
    var j = A.a(1)
    var k = A.a(1,1)
    return 0
}
