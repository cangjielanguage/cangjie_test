// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class A {
    var x: Int64 = 0
    prop var X: Int64 {
        get() {
            return x + y
        }
        set(v) {
            x = v + y
        }
    }
    static var y: Int64 = 0
    static prop var Y: Int64 {
        get() {
            return y
        }
        set(v) {
            y = v
        }
    }
}

func main() {
    var ret = A()
    ret.X = 666
    if ( ret.X != 666 ) {
        return 1
    }
    A.Y = 777
    if ( A.Y != 777 ) {
        return 1
    }
    return 0
}