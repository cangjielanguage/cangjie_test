// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: regex-not core dumped

enum B<T>{a}

enum A<T>{a}

func main():Int64{
    var j = a<Int64> // EXPECTED: regex find multiple constructor 'a' of enum declaration
    return 1
}
