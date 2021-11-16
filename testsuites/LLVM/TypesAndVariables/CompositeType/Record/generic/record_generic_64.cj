// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not stack trace
// ASSERT: regex-not core dumped

record Data<T1> {
    func getX(x: T1):T1{
        return x
    }
}

func main() {
    var a: Int64 = 2
    let x: Int32 = Data<Int32>().getX(a)  // EXPECTED: regex  no matching function declaration for function call
    return 0
}