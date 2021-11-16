// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

interface update{
    operator func [](b:Int32):Bool
    operator func **(b:Int32):Bool
    operator func *(b:Int32):Bool
    operator func /(b:Int32):Bool
    operator func %(b:Int32):Bool
    operator func +(b:Int32):Bool
    operator func -(b:Int32):Bool
    operator func <<(b:Int32):Bool
    operator func >>(b:Int32):Bool
    operator func <(b:Int32):Bool
    operator func <=(b:Int32):Bool
    operator func >(b:Int32):Bool
    operator func >=(b:Int32):Bool
    operator func ==(b:Int32):Bool
    operator func !=(b:Int32):Bool
    operator func &(b:Int32):Bool
    operator func ^(b:Int32):Bool
    operator func |(b:Int32):Bool
//        operator func ^^(b:Int32):Bool
    // operator func +(a:This):Bool
    operator func -():Bool
    // operator func ~(a:This):Bool
    /*
    operator func !(a:This):Bool
    operator func ++(a:This):Bool
    operator func --(a:This):Bool
    */
}

extend Bool <: update {
    operator func [](b:Int32):Bool {true}
    operator func **(b:Int32):Bool {true}
    operator func *(b:Int32):Bool  {true}
    operator func /(b:Int32):Bool  {true}
    operator func %(b:Int32):Bool  {true}
    operator func +(b:Int32):Bool  {true}
    operator func -(b:Int32):Bool  {true}
    operator func <<(b:Int32):Bool {true}
    operator func >>(b:Int32):Bool {true}
    operator func <(b:Int32):Bool  {true}
    operator func <=(b:Int32):Bool {true}
    operator func >(b:Int32):Bool  {true}
    operator func >=(b:Int32):Bool {true}
    operator func ==(b:Int32):Bool {true}
    operator func !=(b:Int32):Bool {true}
    operator func &(b:Int32):Bool  {true}
    operator func ^(b:Int32):Bool  {true}
    operator func |(b:Int32):Bool  {true}
//        operator func ^^(b:Int32):Bool {true}
    // operator func +(a:Bool):Bool  {true}
    operator func -():Bool  {true}
    // operator func ~(a:Bool):Bool  {true}
    /*
    operator func !(a:Bool):Bool  {true}
    operator func ++(a:Bool):Bool {true}
    operator func --(a:Bool):Bool {true}
    */
}

func main(): Int64 {

    var b : Bool = false
    var a : Int32 = 1
    if (!(b[a])) {
        return 1
    }

    if (!(b**a)) {
        return 8
    }
    if (!(b*a)) {
        return 9
    }
    if (!(b/a)) {
        return 10
    }
    if (!(b%a)) {
        return 11
    }
    if (!(b+a)) {
        return 13
    }
    if (!(b-a)) {
        return 14
    }
    if (!(b<<a)) {
        return 17
    }
    if (!(b>>a)) {
        return 18
    }
    if (!(b<a)) {
        return 19
    }
    if (!(b<=a)) {
        return 20
    }
    if (!(b>a)) {
        return 21
    }
    if (!(b>=a)) {
        return 22
    }
    if (!(b==a)) {
        return 23
    }
    if (!(b!=a)) {
        return 24
    }
    if (!(b&a)) {
        return 25
    }
    if (!(b^a)) {
        return 26
    }
    if (!(b|a)) {
        return 27
    }
//    if (!(b^^a)) {
//        return 28
//    }
    // if (!(+b)) {
    //     return 29
    // }
    if (!(-b)) {
        return 30
    }
    // if (!(~b)) {
    //     return 31
    // }
    if (!(!b)) {
        return 32
    }

    /*
    if (!(b++)) {
        return 33
    }
    if (!(b--)) {
        return 34
    }
    */

    return 0
}
