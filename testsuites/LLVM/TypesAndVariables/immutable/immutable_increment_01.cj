// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    var c1: Coo = Coo()
    c1.a ++
    if ( c1.a != 2 ){
        return 1
    }
    Coo.c ++
    if ( Coo.c != 2 ){
        return 1
    }
    var a1: Aoo = Aoo()
    a1.a ++
    if ( a1.a != 2 ){
        return 2
    }
    let a2: Aoo = Aoo()
    a2.a ++
    if ( a2.a != 2 ){
        return 3
    }
    Aoo.c ++
    if ( Aoo.c != 2 ){
        return 1
    }
    var d: Int32 = 1
    d ++
    if ( d != 2 ){
        return 4
    }
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
