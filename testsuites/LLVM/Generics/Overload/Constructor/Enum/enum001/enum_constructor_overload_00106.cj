// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: regex-not core dumped
enum A<X,Y>{
    a |
    a(X)| // EXPECTED: regex-auto 'a' is already exist in enum 'A'
    a(Y)
}

func main():Int64{
    var i = A<Int64,Int64>.a
    return 1
}