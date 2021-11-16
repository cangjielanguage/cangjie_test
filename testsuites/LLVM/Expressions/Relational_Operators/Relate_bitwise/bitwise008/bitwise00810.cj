// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

// 位操作符应用于类成员变量/成员函数返回值
open class Base{
    var base_a: Int32 = 10
}
class Data <: Base {
    var b:Int32 = 10
    var a:Int32
    init(){
        this.a = !this.b+!!!!super.base_a
    }
    func foo(){
        return this.b
    }
}

func main(): Int64 {
    var data = Data()
    var res1 = data.a
    var res2 = !Data().b>>2
    var res3 = !Data().foo()>>2
    if (res1 == -1 && res2 == res3) {
        return 0
    }
    return 1
}
