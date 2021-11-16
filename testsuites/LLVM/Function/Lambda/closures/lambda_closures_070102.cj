// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

var a = 0
var f1:Unit = while ( a > 0 ){
    var a: Int32 = 1
    let b: Int32 = 2
    var x2 = {b} 
    var x3 = {a}() 
    var x4 = {b}() 
}

var f2:Unit = while ( a > 0 ){
    var a: Int32 = 1
    let b: Int32 = 2
    var x2 = foo({b}) 
    var x3 = goo({a}()) 
    var x4 = goo({b}()) 
    var x5 = foo({Coo().a}) 
    var x6 = foo({Roo().a}) 
}

var f5:Unit = while ( a > 0 ) {
    var a: Int32 = 1
    let b: Int32 = 2
    {a}()
    {b} 
}

var f6:Unit = do {
    var a: Int32 = 1
    let b: Int32 = 2
    {b} 
    {b} 
} while ( a > 0)



func foo(x:()->Int32){return x}
func goo(x:Int32){return x}


func main():Int64 {
    if ( f1 != () || f2 != () || f5 != () || f6 != ()){
        return 1
    }
    return 0
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
