// EXEC: %compiler %stdx_cmp_opt %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args

// value的参数类型
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

    operator func []( index: Int64, value: Float64): Unit{
        this.b = 1
    }
    operator func []( index: Int64, value: Int32): Unit{
        this.b = 2
    }
    operator func []( index: Int64, value: String): Unit{
        this.b = 3
    }
    operator func []( index: Int64, value: Bool): Unit{
        this.b = 4
    }
    operator func []( index: Int64, value: List<Int64>): Unit{
        this.b = 5
    }
    operator func []( index: Int64, value: HashSet<Int64>): Unit{
        this.b = 6
    }
    operator func []( index: Int64, value: (Int32*Int32)): Unit{
        this.b = 7
    }
    operator func []( index: Int64, value: (Int32)->Int32): Unit{
        this.b = 8
    }
    /**
    operator func []( index: Int64, value: Range<Int64>): Unit{
        this.b = 9
    }
    */
    operator func []( index: Int64, value: A): Unit{
        this.b = 10
    }
    operator func []( index: Int64, value: B): Unit{
        this.b = 11
    }
    operator func []( index: Int64, value: I): Unit{
        this.b = 12
    }
    operator func []( index: Int64, value: Time): Unit{
        var a = match (value) {
            case _ => 4
        }
        this.b = 13
    }
    operator func []( index: Int64, value: Unit): Unit{
        this.b = 14
    }
}



func main(): Int64{
    var a = A(2)
    a[1] = 2.1
    a[2] = 3
    a[3] = "hello"
    a[4] = true
    a[5] = [1,2,3]
    // a[7] = (1,2)  // 编译报错
    a[8] = B()
    a[9] = Time.Day
    a[10] = A(2)
    // a[11] = {a:Int32=>a}
    a[11] = ()
    if (a.b== 14) {
        return 0
    }
    return 1
}
