// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

func main(): Int64 {
    return run()
}

open class E<T> {
    var e: Char = 'e'
    init(x: T){}
}
open class D<T> <: E<Int32> {
    var d: Char = 'd'
    init(x: T){ super(0) }
}
open class C<T> <: D<Int32> {
    var c: Char = 'c'
    init(x: T){ super(0) }
}
open class B<T> <: C<Int32> {
    var b: Char = 'b'
    init(x: T){ super(0) }
}
class A<T> <: B<Int32> {
    var a: Char = 'a'
    init(x: T){ super(0) }
}

func run(): Int64 {
    let classA: A<Int32> = A<Int32>(0)
    var res1: Char = classA.a
    var res2: Char = classA.b
    var res3: Char = classA.c
    var res4: Char = classA.d
    var res5: Char = classA.e
    if (res1 == 'a' && res2 == 'b' && res3 =='c' && res4 == 'd' && res5 =='e'){
        return 0
    }
    return 1
}
