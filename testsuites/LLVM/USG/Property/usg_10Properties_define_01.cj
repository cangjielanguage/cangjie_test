// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class Foo {
    prop var i: Int64 {
        get() {
            var a = 0
            123 + a
        }
        set(v) {
            var b = 0
            b = v
        }
    }
}

func main() {
    var x = Foo()
    let y = x.i + 1 
    x.i = y
    return 0
}
