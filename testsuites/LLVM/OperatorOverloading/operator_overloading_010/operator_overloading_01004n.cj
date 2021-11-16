// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace


interface TR1 {
    operator func [](b:Bool):Bool
    operator func **(b:Bool):Bool
}

interface TR2{
    operator func [](b:Bool):Int32
    operator func **(b:Bool):Int32
    operator func *(b:Bool):Bool
    operator func /(b:Bool):Bool
    operator func %(b:Bool):Bool
    operator func +(b:Bool):Bool
    operator func -(b:Bool):Bool
}


extend Int32 <: TR1&TR2 {
    operator func [](b:Bool):Bool {true}
    operator func [](b:Bool):Int32 {1}      // EXPECTED:regex function '\[\]' has overload conflicts
    operator func **(b:Bool):Bool {true}
    operator func **(b:Bool):Int32 {2}      // EXPECTED:regex function '\*\*' has overload conflicts
    operator func *(b:Bool):Bool  {true}
    operator func /(b:Bool):Bool  {true}
    operator func %(b:Bool):Bool  {true}
    operator func +(b:Bool):Bool  {true}
    operator func -(b:Bool):Bool  {true}
}

func main(): Int64 {
    var a : Bool = false
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
