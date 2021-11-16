// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: regex-not core dumped

enum B<T>{a(Bool)}

enum A<T>{a(T)}

func main():Int64{
    var i : B<Int64> = a<Int64>(1) // EXPECTED: regex no matching enum constructor 'a' for given arguments
    var j : A<Int64> = a<Int64>(true) // EXPECTED: regex no matching enum constructor 'a' for given arguments
    return 1
}
