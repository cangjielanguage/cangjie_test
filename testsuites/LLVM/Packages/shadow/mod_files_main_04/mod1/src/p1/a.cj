package p1
external func foo(a: Int8) { return 11 } // f1
external func foo(a: Int16) { return 12 } // f2
func main(): Int64 {
    var a = foo(Int8(1))
    if ( a != 11 ) {
        return 1
    }
    return 0
}