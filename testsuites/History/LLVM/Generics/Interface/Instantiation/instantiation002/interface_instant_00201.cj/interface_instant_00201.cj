// EXEC: %compiler %cmp_opt -c %f
trait update{
    func foo(a:This):Int32
}

append B with update{
    func foo(a:B):Int32{1}
}


interface A<T> {
    func test(a:T){
        return 0
    }
}

interface B <: A<Int32>{}
