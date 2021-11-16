// ERRCHECK: %compiler %cmp_opt %f -o %output



func test(): Int64 {
    var a = [[]] // EXPECTED: regex empty list literal type cannot be inferred
    return a.size() - 1
}

func main(): Int64 {
    return test()
}
