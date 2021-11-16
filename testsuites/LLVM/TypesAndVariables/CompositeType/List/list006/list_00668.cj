// ERRCHECK: %compiler %cmp_opt %f -o %output

func test(): Int64 {
    var b : Array<List<Int64>> = [[]].toArray() // EXPECTED: regex empty list literal type cannot be inferred
    return 0
}

func main(): Int64 {
    test()
}
