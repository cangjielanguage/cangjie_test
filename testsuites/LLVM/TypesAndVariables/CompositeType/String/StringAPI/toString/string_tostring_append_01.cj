// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

interface foo {
    func toString(): String
}

extend Int32 <: foo {
    func toString(): String { // EXPECTED: regex function 'toString' has overload conflicts
        return "yes"
    }
}

func run(): Int64 {
    var a : Int32 = 3
    var b = a.toString()
    print("toStringTest:" + b)
    return 0
}

func main(): Int64 {
    return run()
}
