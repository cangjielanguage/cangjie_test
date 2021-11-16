// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class A {
    prop let x: Int64 {
        get() {
            123
        }
    }
    static prop let y: Int64 {
        get() {
            321
        }
    }
}
func main() {
    var a = A()
    print("${a.x}\n") // 123
    print("${A.y}\n") // 321
}