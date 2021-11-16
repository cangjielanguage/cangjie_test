// EXEC-PIPE-1:%compiler %cmp_opt %f -o %output 2>&1 | compare %f

enum Time{
    Day(Int32,Int64) // EXPECTED: regex note.*found candidate
    func foo(x:Int64) { // EXPECTED: regex note.*found candidate
        return 0
    }
    static func bar(x: Int64) {0} // EXPECTED: regex note.*found candidate
    operator func +(right: Int64):Int64 {
        return this.foo(1) + right
    }
}

func main():Int64 {
    Time.Day(2)
    Time.Day(2,3).foo()
    Time.bar()
    Time.Day(2) + 6
    return 0
}
