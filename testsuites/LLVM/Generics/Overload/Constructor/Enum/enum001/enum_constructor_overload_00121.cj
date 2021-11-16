// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: regex-not core dumped

enum B{a}

enum A{a}

func main():Int64{
    var i = a // EXPECTED: regex find multiple constructor 'a' of enum declaration
    return 1
}
