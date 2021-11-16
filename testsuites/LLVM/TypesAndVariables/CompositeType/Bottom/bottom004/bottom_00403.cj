// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func test() : Int64 {
    throw throw Exception() // EXPECT:regex the object thrown must derive from `core.Throwable`
}

func main(): Int64 {
    test()
    return 0
}
