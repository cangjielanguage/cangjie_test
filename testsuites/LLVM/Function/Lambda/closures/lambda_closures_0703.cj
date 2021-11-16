// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

var a: Int32 = 1
let b: Int32 = 2

var f1 = match ( b ){
    case x => var x1 = {a} 
    case x => var x2 = {b} 
    case x => var x3 = {a}() 
    case x => var x4 = {b}() 
}

var f2 = match ( b ){
    case x => var x1 = foo({a}) 
    case x => var x2 = foo({b}) 
    case x => var x3 = goo({a}()) 
    case x => var x4 = goo({b}()) 
    case x => var x5 = foo({Coo().a}) 
    case x => var x6 = foo({Roo().a}) 
}

var f5 = match ( b ) {
    case x => {a} 
    case x => {b} 
}

func main():Int64 {

    return 0
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
