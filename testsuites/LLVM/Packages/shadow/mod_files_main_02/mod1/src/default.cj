import p1.foo
func goo(): Int64 {
    var a = foo(Int8(1))
    if ( a != 11 ) {
        return 1
    }
    return 0
}