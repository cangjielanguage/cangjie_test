// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func main(): Int64 {
    var l: Int64 = 10
    func x(input: Int64): Int64 {input}
    var a: ArrayList<Int64> = ArrayList<Int64>(l, x)
    func test(input: Int64): Bool {
        if (input % 2 == 0) {
            return true
        }
        return false
    }
    a.removeIf(test) // remain 1,3,5,7,9
    if (a.size() != 5) {
        print("a.size() is not 5!")
        return 1
    }
    for (i in 0..5) {
        if (a.get(i) != i * 2 + 1) {
            return 10 + i
        }
    }
    return 0
}