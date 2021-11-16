// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func main(): Int64 {
    var a1: ?Aoo = Aoo(1)
    a1?.a : Option<Int32> // EXPECTED: regex error.*invalid use of operator ':'
    var a2 = a1?.a
    return 0
}

record Coo {
    var a: Int32 = 1
    let b: Int32 = 1
    init (x: Int32 ){ a = x }
}

class Aoo {
    var a: Int32 = 1
    let b: Int32 = 1
    init (x: Int32 ){ a = x }
}
