// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: regex-not core dumped

enum A<T>{a}

enum A{a} // EXPECTED: regex redefinition of declaration 'A'

func main():Int64{
    return 1
}