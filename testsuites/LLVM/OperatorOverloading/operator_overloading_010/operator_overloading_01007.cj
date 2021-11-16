// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

// extend单个泛型操作符TR

interface TR1 {
    operator func !():Bool
}


interface TR2<T>{
    operator func [](b:T):T
    operator func **(b:T):T
    operator func *(b:T):T
    operator func /(b:T):T
    operator func %(b:T):T
    operator func +(b:T):T
    operator func -(b:T):T
}

extend Int32 <: TR2<Bool> {
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
    var b : Int32 = 1
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
    return 0
}
