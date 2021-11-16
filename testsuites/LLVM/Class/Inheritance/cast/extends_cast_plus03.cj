// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

interface Inday1 {
    func getA(): Int64
}

interface Inday2 {
    func getA(): Int32

}

class Data3 <: Inday1 &Inday2  {
    func getA(): Int32 { // EXPECTED: regex function 'getA' has overload conflicts
        var one: Int32 = 3
        return one
    }
    func getA(): Int64 { // EXPECTED: regex function 'getA' has overload conflicts
        var one: Int64 = 4
        return one
    }
}

func run(): Int64 {
    var t: Int32 = Data3().getA()
    if (t == 3) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
