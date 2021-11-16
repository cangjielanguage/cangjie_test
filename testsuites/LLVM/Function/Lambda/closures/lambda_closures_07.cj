// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main():Int64 {
    return 0
}

var a = 0
var f1:Unit = if ( true ){
    var a = 1
    let b = 2
    var x1 = {a} // EXPECTED: regex error.*?lambda captured a mutable variable directly, lambda cannot be assigned to a variable
    var x2 = {b} // EXPECTED: regex-not error
    var x3 = {a}() // EXPECTED: regex-not error
    var x4 = {b}() // EXPECTED: regex-not error
}

var f2:Unit = if ( a > 0 ){
    var a: Int32 = 1
    let b: Int32 = 2
    var x1 = foo({a}) // EXPECTED: regex error.*?lambda captured a mutable variable directly, lambda cannot be used as a param
    var x2 = foo({b}) // EXPECTED: regex-not error
    var x3 = goo({a}()) // EXPECTED: regex-not error
    var x4 = goo({b}()) // EXPECTED: regex-not error
    var x5 = foo({Coo().a}) // EXPECTED: regex-not error
    var x6 = foo({Roo().a}) // EXPECTED: regex-not error
}

var f5:()->Int32 = if ( a > 0 ) {
    var a: Int32 = 1
    let b: Int32 = 2
    {a} // EXPECTED: regex-not error 
    {b} // EXPECTED: regex-not error
}else{
    var a: Int32 = 1
    let b: Int32 = 2
    {b} // EXPECTED: regex-not error
    {a} // EXPECTED: regex-not error 
}

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
