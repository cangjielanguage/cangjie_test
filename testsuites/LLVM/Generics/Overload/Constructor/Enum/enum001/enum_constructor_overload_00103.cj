// EXEC-PIPE-1: %compiler %frontend %typecheck %cmp_opt %f 2>&1 | compare %f

enum A<T>{
    a |
    a(T)|
    a(T,T)
}

func main():Int64{
    var i = A<Int64>.a // ASSERT: regex-auto reference to overloaded function 'a' could not be resolved
    var j = A<Int64>.a(1)
    var k = A<Int64>.a(1,1)
    return 0
}
