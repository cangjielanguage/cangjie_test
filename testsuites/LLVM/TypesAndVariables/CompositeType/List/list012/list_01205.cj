// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

// listExpr中元素的类型要求是Type的子类型  子类 < 父类
open class A {
    var a: Int32
    init(x: Int32){
        a = x
    }
}
class B <: A{
    var b: Int32
    init(x: Int32, y: Int32){
        super(y)
        b = x
    }
}
func main(): Int64 {
    var child :List<B> = [B(1,2), B(3,4)]
    var father :List<A> = [A(1), A(2), *[B(1,2), B(3,4)]]
    if (father[3].a == 4) {
        return 0
    }
    return 1
}
