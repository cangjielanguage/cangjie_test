import p1.foo
func main(x:String): Int64 {
    var a = foo(Int8(1))
    if ( a != 11 ) {
        return 1
    }
    return 0
}