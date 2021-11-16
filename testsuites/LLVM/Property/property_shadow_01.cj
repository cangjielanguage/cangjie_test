// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

open class Foo {
    prop let a: Int64 {
        get() { return 0 }
    }
    var b:Int64  = 1
}

class Coo <: Foo{
    var a:Int64  = 1 // EXPECTED: regex non-static member 'a' cannot have the same name with non-static member in parent class or interfaces
    prop let b: Int64 { // EXPECTED: regex non-static member 'b' cannot have the same name with non-static member in parent class or interfaces
        get() { return 0 }
    }
}

func main():Int64 {

    return 0
}
