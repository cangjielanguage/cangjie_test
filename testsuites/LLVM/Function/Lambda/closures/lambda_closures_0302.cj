// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args


var a = {
    var a: Int32 = 1
    var x3 = {a}()
    true
    }()


var b = { 
    let b: Int32 = 2
    var x2 = {b} 
    var x4 = {b}() 
    true
    }

var c = {
    var a: Int32 = 1
    let b: Int32 = 2
    var x2 = {b} 
    var x3 = {a}() 
    var x4 = {b}() 
    true
    }()

var x = { var a=1;var b={a}()}()

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

func main():Int64 {
    if ( !a ){
        return 1
    }
    if ( !b() ){
        return 1
    }
    if ( !c ){
        return 1
    }
    if ( x != () ){
        return 1
    }
    return 0
}
