// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func main(): Int64 {
    var a1: Array<Aoo> = Array<Aoo>(2,{ i => Aoo(i) })
    a1[0].b++ // EXPECTED: regex-auto cannot assign to value which is an initialized 'let' constant 
    var c1: Array<Coo> = Array<Coo>(2,{ i => Coo(i) })
    c1[0].a++ // EXPECTED: regex-auto cannot change immutable value : function call returns immutable value
    c1[0] = Coo(4) 
    c1[0].b++ // EXPECTED: regex-auto cannot assign to value which is an initialized 'let' constant
    return 0
}

record Coo {
    var a: Int64 = 1
    let b: Int64 = 1
    init (x: Int64 ){ a = x }
}

class Aoo {
    var a: Int64 = 1
    let b: Int64 = 1
    init (x: Int64 ){ a = x }
}
