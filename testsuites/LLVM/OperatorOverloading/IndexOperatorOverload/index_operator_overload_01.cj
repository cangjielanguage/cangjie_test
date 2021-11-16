// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

// 正确的索引操作符重载
class A{
    var a: Int64
    var b: Int64
    init(x: Int64){
        a = x
        b = x
    }
    public operator func []( index: Int64): Int64{
        if (index > 1) {
            3
        } else {
            this.a
        }
    }
    public operator func []( index: Int64, value: Int64): Unit{
        this.b = value
    }
}

func main(): Int64{
    var a = A(2)
    a[2] = 4
    if (a[1] == 2 && a.b== 4) {
        return 0
    }
    return 1
}