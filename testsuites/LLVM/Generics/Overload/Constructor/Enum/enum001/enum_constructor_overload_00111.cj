// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: regex-not core dumped

enum B{a(Bool)}

enum A<T>{a}

func main():Int64{
    var j = a // EXPECTED: regex generic type should be used with type argument
    return 1
}