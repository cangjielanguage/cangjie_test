package p1
external func foo(a: Int8) { return 11 } // f1
external func foo(a: Int16) { return 12 } // f2
func foo(a: Int32) { return 13 }
external func goo() { return 1 }
external func main(): Int64 {
    var a = foo(Int8(1))
    if ( a != 11 ) {
        return 1
    }
    return 0
}
