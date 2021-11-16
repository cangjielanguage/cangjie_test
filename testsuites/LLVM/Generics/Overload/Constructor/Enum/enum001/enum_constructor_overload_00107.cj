// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: regex-not core dumped
enum A<T>{
    a(Int64,Int64) | // EXPECTED: regex 'a' is already exist in enum 'A'
    a(T,Int64)| // EXPECTED: regex 'a' is already exist in enum 'A'
    a(T,T)
}

func main():Int64{
    var i = A<Int64,Int64>.a
    return 1
}