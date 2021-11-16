// DEPENDENCE: ../src ../cfg-ast
// EXEC: %compiler %cmp_opt -c src/pkga/pkga.cj -o pkga.%middle
// EXEC: %compiler %cmp_opt -c src/pkgb/pkgb.cj -o pkgb.%middle
// EXEC: %compiler %cmp_opt -c src/pkgc/pkgc.cj -o pkgc.%middle
// EXEC: %compiler %cmp_opt %f pkga.%middle pkgb.%middle pkgc.%middle -import-config  cfg-ast -o %output
// EXEC: %run %run_opt %output %run_args

import pkga.*
import pkgb.*
import pkgc.*

class C{}
record Data{
    var x:Int32
    init(input:Int32){x=input}
}
extend Data <: TR2&TR3 {
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
//        operator func ^^(b:Bool):Bool {true}
}

extend C <: TR1& TR2{
    operator func [](b:Bool):Bool{true}
    operator func **(b:Bool):Bool{true}
    operator func *(b:Bool):Bool{true}
    operator func /(b:Bool):Bool{true}
    operator func %(b:Bool):Bool{true}
    operator func +(b:Bool):Bool{true}
    operator func -(b:Bool):Bool{true}
    operator func !():Bool {true}
    operator func -():Bool {true}
}

func main(): Int64 {
    var a : Bool = false
    var b : Data = Data(1)
    var c = C()
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

    if (!(c[a])) {
        return 29
    }
    if (!(c**a)) {
        return 30
    }
    if (!(c*a)) {
        return 31
    }
    if (!(c/a)) {
        return 32
    }
    if (!(c%a)) {
        return 33
    }
    if (!(c+a)) {
        return 34
    }
    if (!(c-a)) {
        return 35
    }
    if (!(!c)) {
        return 37
    }
    if (!(-c)) {
        return 40
    }

    return 0
}

