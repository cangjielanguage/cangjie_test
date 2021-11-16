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

var s3 = hoo()
var s4 = koo()
var s5 = moo()
var s6 = noo()
var s7 = loo()

func main():Int64 {
    if ( s3() != 45 ) {
        return 1
    }
    if ( s4 != 45 ) {
        return 2
    }
    if ( s5() != 45 ) {
        return 3
    }
    if ( s6() != 45 ) {
        return 4
    }
    if ( s7 != 1 ) {
        return 5
    }
    return 0
}

func hoo():()->Int32 {return { a + b + Coo().a
                          + Coo().b + Coo.c + Coo.d + Coo().e + Coo().f
                          + Roo().a + Roo().b + Roo.c + Roo.d + Roo().e + Roo().f}}
func koo():Int32 {return { a + b + Coo().a
                          + Coo().b + Coo.c + Coo.d + Coo().e + Coo().f
                          + Roo().a + Roo().b + Roo.c + Roo.d + Roo().e + Roo().f}()}

func moo(x!:()->Int32={ a + b + Coo().a
                          + Coo().b + Coo.c + Coo.d + Coo().e + Coo().f
                          + Roo().a + Roo().b + Roo.c + Roo.d + Roo().e + Roo().f}){
                          return x}

func noo():()->Int32{{a + b + Coo().a
                          + Coo().b + Coo.c + Coo.d + Coo().e + Coo().f
                          + Roo().a + Roo().b + Roo.c + Roo.d + Roo().e + Roo().f}}
func loo():Int32{{a + b + Coo().a
                          + Coo().b + Coo.c + Coo.d + Coo().e + Coo().f
                          + Roo().a + Roo().b + Roo.c + Roo.d + Roo().e + Roo().f}
                          1}



