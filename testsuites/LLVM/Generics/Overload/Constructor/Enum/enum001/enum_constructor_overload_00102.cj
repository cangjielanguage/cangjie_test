// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: regex-not core dumped
enum A{
    a |
    a(Int64)|
    a(Int64) // EXPECTED: regex function 'a' has overload conflicts
}

func main():Int64{
    return 1
}