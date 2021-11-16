// EXEC-PIPE-1:%compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f

open class Foo {
    var dt: Int32 = 3
}

class Bar<T> <: Foo {
    var dt: T
    init(x: T){
        dt = x
    }
}

class Data<T1>
    where T1 <: Bar<Int32>{ // EXPECTED: regex note.*'Class-Foo' is not '<:' 'Class-Bar<Int32>'
    var classFoo: T1
    init(x: T1){
        classFoo = x
    }
}

func main(): Int64 {
    let foo: Foo = Foo()
    let data = Data<Foo>(foo)
    return 0
}
