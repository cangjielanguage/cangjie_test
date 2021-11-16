// DEPENDENCE: ../src ../cfg-ast
// EXEC: %compiler %cmp_opt -c src/pkga/pkga.cj -o pkga.%middle
// EXEC: %compiler %cmp_opt -c src/pkgb/pkgb.cj -o pkgb.%middle
// EXEC: %compiler %cmp_opt %f pkga.%middle pkgb.%middle -import-config  cfg-ast -o %output
// EXEC: %run %run_opt %output %run_args


import pkga.*
import pkgb.*

class C{}

extend C <: TR2<Bool>{
    operator func [](b:Bool):Bool {b}
    operator func **(b:Bool):Bool {b}
    operator func *(b:Bool):Bool  {b}
    operator func /(b:Bool):Bool  {b}
    operator func %(b:Bool):Bool  {b}
    operator func +(b:Bool):Bool  {b}
    operator func -(b:Bool):Bool  {b}
}

extend C <: TR1{
    operator func !():Bool {true}
}
func main(): Int64 {
    var a : Bool = true
    var c = C()
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
        return 36
    }
    return 0
}

