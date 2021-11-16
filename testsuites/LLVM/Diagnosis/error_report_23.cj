// EXEC-PIPE-1:%compiler %cmp_opt %f -o %output 2>&1 | compare %f

enum Time{
    Day(Int64) // EXPECTED: regex note.*found candidate
    func foo(x:Int64) { // EXPECTED: regex note.*found candidate
        return 0
    }
    static func bar(x: Int64) {0} // EXPECTED: regex note.*found candidate
    operator func +(right: Int64):Int64 {
        return this.foo(1) + right
    }
}

func main():Int64 {
    Time.Day(2,3)
    Time.Day(3).foo(3,4)
    Time.bar(4,5)
    Time.Day(2) + 6 + 7
    return 0
}
