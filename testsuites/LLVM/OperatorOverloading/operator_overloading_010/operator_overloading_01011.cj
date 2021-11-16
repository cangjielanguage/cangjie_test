// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

// extend泛型操作符TR/以及非泛型TR

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

record Data{
    var x:Int32
    init(input:Int32){x=input}
}

extend Data <: TR2<Bool>& TR1 { 
    operator func [](b:Bool):Bool {b}
    operator func **(b:Bool):Bool {b}
    operator func *(b:Bool):Bool  {b}
    operator func /(b:Bool):Bool  {b}
    operator func %(b:Bool):Bool  {b}
    operator func +(b:Bool):Bool  {b}
    operator func -(b:Bool):Bool  {b}

    operator func !():Bool {true}
}

func main(): Int64 {
    var a : Bool = true
    var b : Data = Data(1)
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
    if (!(!b)) {
        return 15
    }
    return 0
}
