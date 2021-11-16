// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

// 不声明返回类型
class A {
    var a: Int64
    var b: Int64
    init(x: Int64){
        a = x
        b = x
    }
    operator func []( index: Int64, value: Int64) {
        this.b = value
    }
}

func main(): Int64{
    var a = A(2)
    a[2] = 4
    if (a.b==4){
        return 0
    }
    return 1
}