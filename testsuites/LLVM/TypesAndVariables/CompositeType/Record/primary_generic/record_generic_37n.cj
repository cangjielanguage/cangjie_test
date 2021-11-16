// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

open class Foo<T> {
    var dt: Int32 = 1
    Data(x: Int32){
        dt = x
    }
    Data(){}
}

class Bar<T> <: Foo<Int32> {}

record Data<T1>
    where T1 <: Bar<Int32> {
    let classBar: T1
    Data(x: T1){
        classBar = x
    }
}

func run(): Int64 {
    var dt: Int32 = 3
    let foo: Foo<Int32> = Foo<Int32>(3)
    let data: Data<Foo<Int32>> = Data<Foo<Int32>>(foo) // EXPECTED: regex generics type arguments do not match the constraint
    var classFoo: Foo = data.classFoo
    var res: Int32 = classFoo.dt
    if (res == 2) {
        return 0
    }
    return
}

func main(): Int64 {
    return run()
}
