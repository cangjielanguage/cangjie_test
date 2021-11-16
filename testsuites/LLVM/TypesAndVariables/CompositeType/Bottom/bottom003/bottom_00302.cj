// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

record C<T>{
    func test() {
        var x : T // type here
        x = return // EXPECTED: regex expression of Nothing type cannot appear here currently
    }
}

func main(): Int64 {
    return 0
}
