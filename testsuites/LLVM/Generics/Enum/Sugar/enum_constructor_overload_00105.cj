// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: regex-not core dumped
enum A<T>{
    a |
    a(T)|
    a(T) // EXPECTED: regex function 'a' has overload conflicts
}

func main():Int64{
    var i = A.a
    return 1
}