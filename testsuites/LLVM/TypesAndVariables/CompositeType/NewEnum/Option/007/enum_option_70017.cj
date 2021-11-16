// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

extend ?Int64{ // EXPECTED: regex-auto extend type cannot use '?Type' sugar
    func test(){0}
}
func main(): Int64 {
    var a : ?Int64 = 1
    a.test()
}
