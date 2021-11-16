// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func main(): Int64 {
    var a1: List<Aoo> = [Aoo(2),Aoo(3)]
    a1[0].b++ 
    a1[0] = Aoo(4)// EXPECTED: regex-auto type Class-List<Class-Aoo> does not have operator func [](index, value) 

    var c1: List<Coo> = [Coo(2),Coo(3)]
    c1[0].a++ 
    c1[0] = Coo(4)
    c1[0].b++ 
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
