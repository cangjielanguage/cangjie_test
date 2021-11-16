// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

var a: Int32 = 1
let b: Int32 = 2

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

var s1 = { var s = a + b
    + Coo().a + Coo().b + Coo.c + Coo.d + Coo().e + Coo().f
    + Roo().a + Roo().b + Roo.c + Roo.d + Roo().e + Roo().f;return s}

var s2 = { var s = a + b + Coo().a
        + Coo().b + Coo.c + Coo.d + Coo().e + Coo().f
        + Roo().a + Roo().b + Roo.c + Roo.d + Roo().e + Roo().f;return s}()

var s3 = foo({ var s = a + b
                 + Coo().a + Coo().b + Coo.c + Coo.d + Coo().e + Coo().f
                 + Roo().a + Roo().b + Roo.c + Roo.d + Roo().e + Roo().f;return s})


func main():Int64 {
    if ( s1() != 45 ) {
        return 1
    }
    if ( s2 != 45 ) {
        return 1
    }
    if ( s3() != 45 ) {
        return 1
    }
    return 0
}

func foo(x:()->Int32){return x}
func goo(x:Int32){return x}
