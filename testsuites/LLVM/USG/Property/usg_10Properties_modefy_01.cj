// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

open class A {
    private var valueX = 0
    private static var valueY = 0
    open prop let x: Int64 {
        get() { valueX }
    }
    static prop var y: Int64 {
        get() { valueY }
        set(v) {
            valueY = v
        }
    }
}

class B <: A {
    private var valueX2 = 0
    private static var valueY2 = 0
    override prop let x: Int64 {
        get() { valueX2 }
    }
    redef static prop var y: Int64 {
        get() { valueY2 }

        set(v) {
            valueY2 = v
        }
    }
}

func main() {
    var b = B()
    let a = B.y + 1 
    B.y = a
    let c = b.x
    return 0
}
