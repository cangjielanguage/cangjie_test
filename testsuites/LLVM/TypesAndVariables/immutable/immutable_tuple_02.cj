// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func main(): Int64 {
    var a1: (Aoo*Coo) = (Aoo(2),Coo(2))
    a1[0].b++ 
    a1[0] = Aoo(4) // EXPECTED: regex-auto 'tuple element' can not be assigned
    a1[1].a++ 
    a1[1] = Coo(4) 
    a1[1].b++ 
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
