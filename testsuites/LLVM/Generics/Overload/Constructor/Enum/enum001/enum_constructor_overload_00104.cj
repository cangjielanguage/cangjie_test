// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: regex-not core dumped
enum A<T>{
    a |
    a(T)|  // EXPECTED: regex-auto 'a' is already exist in enum 'A'
    a(Int64)
}

func main():Int64{
    var i = A<Int64>.a
    return 1
}