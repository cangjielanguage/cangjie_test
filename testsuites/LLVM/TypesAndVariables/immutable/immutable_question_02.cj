// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func main(): Int64 {
    var a1: ?Aoo = Aoo(1)
    a1?.b = 3 // EXPECTED: regex error.*cannot assign to value which is an initialized 'let' constant
    let a3: ?Aoo = Aoo(1)
    a3?.b = 3 // EXPECTED: regex error.*cannot assign to value which is an initialized 'let' constant
    var a4: ?Coo = Coo(1)
    a4?.a = 3 // EXPECTED: regex error.*cannot assign to value which is an initialized 'let' constant
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
