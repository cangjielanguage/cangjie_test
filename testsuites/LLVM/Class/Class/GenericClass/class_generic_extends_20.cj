// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

class Foo<T>{
    var foo: T
    init(x: T){
        foo = x
    }
}

open class Base<T> {
    var a: Foo<Int32> = Foo<Int32>(2)
}

class Data<T> <: Base<T> {
    var a: Foo<Int32> = Foo<Int32>(3)  // EXPECTED: regex the variable 'a' must not shadow a member variable of the supertype
}

func main(): Int64 {
    var base: Base<Int32> = Base<Int32>()
    var data: Data<Int32> = Data<Int32>()
    var res: Int32 = data.a.foo
    if(res == 3){
        return 0
    }
    return 1
}
