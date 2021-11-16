// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import collection.*
interface update{
    operator func [](b:Bool):Bool
    operator func **(b:Bool):Bool
    operator func *(b:Bool):Bool
    operator func /(b:Bool):Bool
    operator func %(b:Bool):Bool
    operator func +(b:Bool):Bool
    operator func -(b:Bool):Bool
    operator func <<(b:Bool):Bool
    operator func >>(b:Bool):Bool
    operator func <(b:Bool):Bool
    operator func <=(b:Bool):Bool
    operator func >(b:Bool):Bool
    operator func >=(b:Bool):Bool
    operator func ==(b:Bool):Bool
    operator func !=(b:Bool):Bool
    operator func &(b:Bool):Bool
    operator func ^(b:Bool):Bool
    operator func |(b:Bool):Bool
//    operator func ^^(b:Bool):Bool
    operator func -():Bool
    //operator func ~():Bool
    operator func !():Bool
    //operator func ++():Bool
    //operator func --():Bool
}

extend HashSet<T> <: update where T<:Int32, T<: Hashable, T<: Equatable<T>  {
    operator func [](b:Bool):Bool {true}
    operator func **(b:Bool):Bool {true}
    operator func *(b:Bool):Bool  {true}
    operator func /(b:Bool):Bool  {true}
    operator func %(b:Bool):Bool  {true}
    operator func +(b:Bool):Bool  {true}
    operator func -(b:Bool):Bool  {true}
    operator func <<(b:Bool):Bool {true}
    operator func >>(b:Bool):Bool {true}
    operator func <(b:Bool):Bool  {true}
    operator func <=(b:Bool):Bool {true}
    operator func >(b:Bool):Bool  {true}
    operator func >=(b:Bool):Bool {true}
    operator func ==(b:Bool):Bool {true}
    operator func !=(b:Bool):Bool {true}
    operator func &(b:Bool):Bool  {true}
    operator func ^(b:Bool):Bool  {true}
    operator func |(b:Bool):Bool  {true}
    //operator func ^^(b:Bool):Bool {true}
    operator func -():Bool  {true}
    //operator func ~():Bool  {true}
    operator func !():Bool  {true}
    //operator func ++():Bool {true}
    //operator func --():Bool {true}
}

func main(): Int64 {

    var a : Bool = false
    var b : HashSet<Int32> = HashSet<Int32>()
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

    if (!(-b)) {
        return 30
    }
//    if (!(~b)) {
//        return 31
//    }
    if (!(!b)) {
        return 32
    }

    /*if (!(b++)) {
        return 33
    }
    if (!(b--)) {
        return 34
    }*/

    return 0
}
