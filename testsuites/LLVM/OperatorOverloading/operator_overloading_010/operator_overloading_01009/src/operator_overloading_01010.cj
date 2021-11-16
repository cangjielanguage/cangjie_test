// DEPENDENCE: ../src ../cfg-ast
// EXEC: %compiler %cmp_opt -c src/pkgb/pkgb.cj -o pkgb.%middle
// EXEC: %compiler %cmp_opt %f pkgb.%middle -import-config  cfg-ast -o %output
// EXEC: %run %run_opt %output %run_args


import pkgb.*

class C{}
record Data{
    var x:Int32
    init(input:Int32){x=input}
}
extend Data <: TR2<Bool> {
    operator func [](b:Bool):Bool {b}
    operator func **(b:Bool):Bool {b}
    operator func *(b:Bool):Bool  {b}
    operator func /(b:Bool):Bool  {b}
    operator func %(b:Bool):Bool  {b}
    operator func +(b:Bool):Bool  {b}
    operator func -(b:Bool):Bool  {b}
}

extend C <: TR2<Bool>{
    operator func [](b:Bool):Bool {b}
    operator func **(b:Bool):Bool {b}
    operator func *(b:Bool):Bool  {b}
    operator func /(b:Bool):Bool  {b}
    operator func %(b:Bool):Bool  {b}
    operator func +(b:Bool):Bool  {b}
    operator func -(b:Bool):Bool  {b}
}

func main(): Int64 {
    var a : Bool = true
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
    return 0
}

