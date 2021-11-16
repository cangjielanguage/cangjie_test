// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output  2>&1| compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

let x = 4
func f() {
    print("${x}") // Print 4.
    let x: Int64
    func f1() {
        print("${x}") // EXPECTED:regex error.*?variable 'x' is used before initialization
    }
    x = 99
    f1()
}

func main() {
    return 0
}
