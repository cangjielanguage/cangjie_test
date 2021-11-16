// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

open class Foo {
    var dt: Int32 = 2
}

class Bar <: Foo {}

class Data<T1>
    where T1 <: Bar {
    var classFoo: T1
    init(x: T1){
        classFoo = x
    }
}

func run(): Int64 {
    let foo: Foo= Foo()
    let data: Data<Foo> = Data<Foo>(foo) // EXPECTED: regex generics type arguments do not match the constraint
    var classFoo: Foo = data.classFoo
    var res: Int32 = classFoo.dt
    if (res == 2) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
