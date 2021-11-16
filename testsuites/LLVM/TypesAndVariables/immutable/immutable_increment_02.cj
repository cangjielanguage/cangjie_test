// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func main(): Int64 {
    let c1: Coo = Coo()
    c1.a ++  // EXPECTED: regex error.*cannot assign to value which is an initialized 'let' constant
    var c2: Coo = Coo()
    c2.b ++  // EXPECTED: regex error.*cannot assign to value which is an initialized 'let' constant
    let c3: Coo = Coo()
    c3.b ++  // EXPECTED: regex error.*cannot assign to value which is an initialized 'let' constant
    let a1: Aoo = Aoo()
    a1.b ++ // EXPECTED: regex error.*cannot assign to value which is an initialized 'let' constant
    var a2: Aoo = Aoo()
    a2.b ++ // EXPECTED: regex error.*cannot assign to value which is an initialized 'let' constant
    let d: Int32 = 1
    d ++ // EXPECTED: regex error.*cannot assign to value which is an initialized 'let' constant
    Coo.d ++ // EXPECTED: regex error.*cannot assign to value which is an initialized 'let' constant
    Aoo.d ++ // EXPECTED: regex error.*cannot assign to value which is an initialized 'let' constant
    return 0
}

record Coo {
    var a: Int32 = 1
    let b: Int32 = 1
    static var c: Int32 = 1
    static let d: Int32 = 1
}

class Aoo {
    var a: Int32 = 1
    let b: Int32 = 1
    static var c: Int32 = 1
    static let d: Int32 = 1
}
