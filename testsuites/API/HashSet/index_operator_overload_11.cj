// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

// index的参数类型
from std import collection.*
record B{}
interface I{}
enum Time {Day}

class A{
    var a: Int64
    var b: Int64
    init(x: Int64){
        a = x
        b = x
    }

    operator func []( index: Float64, value: Int64): Unit{
        this.b = value
    }
    operator func []( index: Int32, value: Int64): Unit{
        this.b = value
    }
    operator func []( index: String, value: Int64): Unit{
        this.b = value
    }
    operator func []( index: Bool, value: Int64): Unit{
        this.b = value
    }
    operator func []( index: List<Int64>, value: Int64): Unit{
        this.b = value
    }
    operator func []( index: HashSet<Int64>, value: Int64): Unit{
        this.b = value
    }
    operator func []( index: (Int32*Int32), value: Int64): Unit{
        this.b = value
    }
    operator func []( index: (Int32)->Int32, value: Int64): Unit{
        this.b = value
    }
    /**
    operator func []( index: Range<Int64>, value: Int64): Unit{
        this.b = value
    }
    */
    operator func [](  index: A, value: Int64): Unit{
        this.b = value
    }
    operator func []( index: B, value: Int64): Unit{
        this.b = value
    }
    operator func []( index: I, value: Int64): Unit{
        this.b = value
    }
    operator func []( index: Time, value: Int64): Unit{
        var a = match (index) {
            case _ => 4
        }
        this.b = value
    }
    operator func []( index: Unit, value: Int64): Unit{
        this.b = value
    }
}



func main(): Int64{
    var a = A(2)
    a[2.1] = 1
    a[3] = 2
    a["hello"] = 3
    a[true] = 4
    a[[1,2,3]] = 5
    // a[(1,2)] = 7  // 编译报错
    a[B()] = 8
    a[Time.Day] = 9
    a[A(2)] = 10
    a[()] = 11
    // a[{a:Int32=>a}] = 12
    if (a.b== 11) {
        return 0
    }
    return 1
}
