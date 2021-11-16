// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

func main():Int64 {
    return 0
}

var a = 0

var f1:Unit = if ({
    var a: Int32 = 1
    let b: Int32 = 2
    var x2 = {b} // EXPECTED: regex-not error
    var x3 = {a}() // EXPECTED: regex-not error
    var x4 = {b}() // EXPECTED: regex-not error
    true
}()){()}

var f2:Unit = if ({
    var a: Int32 = 1
    let b: Int32 = 2
    var x2 = foo({b}) // EXPECTED: regex-not error
    var x3 = goo({a}()) // EXPECTED: regex-not error
    var x4 = goo({b}()) // EXPECTED: regex-not error
    var x5 = foo({Coo().a}) // EXPECTED: regex-not error
    var x6 = foo({Roo().a}) // EXPECTED: regex-not error
    false
}()){()}

func foo(x:()->Int32){return x}
func goo(x:Int32){return x}


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
