// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class Foo {}
extend Foo {
    static prop let i: Int64 {
        get() { 0 }
    }
}
func main() {
    Foo.i + 1
    return 0
}
