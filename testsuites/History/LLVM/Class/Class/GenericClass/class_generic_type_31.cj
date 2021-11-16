// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    return run()
}

class Foo<T>  <: Hashable & Equatable<Foo<T>> {
    var x: T
    var y: T
    init(a: T, b: T){
        x = a
        y = b
    }

    operator func !=(b:Foo<T>){
        true
    }

    operator func ==(b:Foo<T>){
        false
    }

    func hashCode() : UInt64 {
        return 0
    }

}

func run(): Int64 {
    var foo1: Foo<Int32> = Foo<Int32>(1, 2)
    var foo2: Foo<Int32> = Foo<Int32>(3, 4)
    var setFoo: Set<Foo<Int32>> = #{foo1, foo2}
    // var foo: Foo<Int32>
    for (foo in setFoo) {
        foo2 = foo
    }
    var res1: Int32 = foo2.x
    var res2: Int32 = foo2.y
    if (res1 == 1 && res2 == 2){
        return 0
    }
    return 1
}
