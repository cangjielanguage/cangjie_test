// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class Foo {
    private var a: Int64 = 0
    prop var b: Int64 {
        get() {
            print("get")
            return a
        }
        set(value) {
            print("set")
            a = value
        }
    }
}
func main() {
    var x = Foo()
    let y = x.b + 1 // get
    x.b = y // set
    return 0
}
