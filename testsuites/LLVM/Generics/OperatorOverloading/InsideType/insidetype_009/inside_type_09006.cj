// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: regex-not core dumped

interface A<T>{
    static func test():Int64{1}
    let i = 1
    operator func *(input_b:A<T>):Bool  {
        var a = i
        var b = test()
        var f = A<Int32>.i
        var g = A<Int32>.test()
        return true
    }
}

interface B<T> <: A<T>{}
class C <: A<Int32>{}
class D <: B<Int32>{}


func main(): Int64 {
    var a : B<Int32> = D()
    var b : C = C()
    a*a
    b*b
    return 1
}