// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class Foo {
    prop let a: Int64 {
        get() {
            return 0
        }
    }
     
    prop var b: Int64 {
        get() {
            return 0
        }
        set(v) {
        }
    }
}
func main() {
    var x = Foo()
    return 0
}
