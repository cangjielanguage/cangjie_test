// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

// record
record A{
    var a: Int64
    static var b: Int64 = 5
    init(x: Int64){
        a = x
        b = x
    }
    operator func []( index: Int64): Int64{
        if (index > 1) {
            3
        } else {
            this.a
        }
    }
    operator func []( index: Int64, value: Int64): Unit{
        A.b = value
    }
    operator func +( index: Int64): Unit{
        A.b = A.b + index
    }
}



func main(): Int64{
    var a = A(2)
    a[2] = 4
    // A(2)[2] = 4
    a + 2
    if (a[1] == 2 && A.b== 6) {
        return 0
    }
    return 1
}