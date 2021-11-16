// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

// listExpr中元素的类型要求是Type的子类型  泛型子类 < 泛型父类
open class A<T> {
    var a: T
    init(x: T){
        a = x
    }
}
class B<T> <: A<T>{
    var b: T
    init(x: T, y: T){
        super(y)
        b = x
    }
}
func main(): Int64 {
    var father :List<A<Int64>> = [A<Int64>(1), A<Int64>(2), *[B<Int64>(1,2), B<Int64>(3,4)]]
    if (father[3].a == 4) {
        return 0
    }
    return 1
}
