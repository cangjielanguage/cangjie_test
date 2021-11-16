// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: regex-not core dumped

open class C{
    let c = 1
}

class A<T> <: C{
    func test():Int64{1}
    let i = 1
    operator func *(input_b:A<T>):Bool  {
        var a = i // EXPECTED: regex-not error
        var b = test() // EXPECTED: regex-not error
        var c = this() // EXPECTED: regex-auto invalid calling 'this' outside the constructor
        var d = super() // EXPECTED: regex-auto invalid calling 'super' outside the constructor
        var e = super.c // EXPECTED: regex-not error
        var f = this.i // EXPECTED: regex-not error
        var g = this.test() // EXPECTED: regex-not error
        return true
    }
}


func main(): Int64 {
    return 1
}
