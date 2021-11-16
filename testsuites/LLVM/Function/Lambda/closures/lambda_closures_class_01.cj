// EXEC: %compiler %cmp_opt %n.cj -o %output

func main():Int64 {
    if ( case01().foo()() != 5 ) {
        return 1
    }
    if ( case02().foo() != 5 ) {
        return 2
    }
    if ( case03().foo()() != 5 ) {
        return 3
    }
    if ( case04().foo()() != 5 ) {
        return 3
    }
    return 0
}


class case01{
    var a: Int32 = 1
    let b: Int32 = 2
    func foo(){
        return { a + b
                   + Coo().a + Coo().b + Coo.c + Coo.d + Coo().e + Coo().f
                   + Roo().a + Roo().b + Roo.c + Roo.d + Roo().e + Roo().f}
    }
}

class case02{
    var a: Int32 = 1
    let b: Int32 = 2
    func foo(){
        return { a + b + Coo().a
                       + Coo().b + Coo.c + Coo.d + Coo().e + Coo().f
                       + Roo().a + Roo().b + Roo.c + Roo.d + Roo().e + Roo().f}()
    }
}

class case03{
    var a: Int32 = 1
    let b: Int32 = 2
    func foo(x!:()->Int32={ a + b
                           + Coo().a + Coo().b + Coo.c + Coo.d + Coo().e + Coo().f
                           + Roo().a + Roo().b + Roo.c + Roo.d + Roo().e + Roo().f}){
        return x
    }
}

class case04{
    var a: Int32 = 1
    let b: Int32 = 2
    func foo(){
        var x = { a + b + Coo().a
                       + Coo().b + Coo.c + Coo.d + Coo().e + Coo().f
                       + Roo().a + Roo().b + Roo.c + Roo.d + Roo().e + Roo().f}
        return x
    }
}

class Coo{
    var a: Int32 = 1
    let b: Int32 = 2
    static var c: Int32 = 3
    static let d: Int32 = 4
    var e: Int32
    let f: Int32
    init(){
        e = 5
        f = 6
    }
}

record Roo{
    var a: Int32 = 1
    let b: Int32 = 2
    static var c: Int32 = 3
    static let d: Int32 = 4
    var e: Int32
    let f: Int32
    init(){
        e = 5
        f = 6
    }
}

