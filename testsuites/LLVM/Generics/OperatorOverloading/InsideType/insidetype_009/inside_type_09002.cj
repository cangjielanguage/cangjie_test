// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 |compare %f
// ASSERT: regex-not core dumped

interface C{
    let c = 1 // EXPECTED: regex variable 'c' can not be declared in interface
}

interface A<T> <: C{
    func test():Int64{1}
    operator func *(input_b:A<T>):Bool  {
        var b = test() // EXPECTED: regex-not error
        var c = this() // EXPECTED: regex 'this' can not be used in interface
        var d = super() // EXPECTED: regex 'super' cannot be used in interface
        var e = super.c // EXPECTED: regex 'super' cannot be used in interface
        var g = this.test() // EXPECTED: regex-not error
        return true
    }
}


func main(): Int64 {
    return 1
}
