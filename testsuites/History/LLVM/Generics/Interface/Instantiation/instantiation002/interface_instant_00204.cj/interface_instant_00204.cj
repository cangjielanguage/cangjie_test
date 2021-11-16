// EXEC: %compiler %cmp_opt -c %f
class A<T>{}

trait update{
    func foo(a:This):Int32
}

append A<Int32> with update{
    func foo(a:A<Int32>):Int32{1}
}
