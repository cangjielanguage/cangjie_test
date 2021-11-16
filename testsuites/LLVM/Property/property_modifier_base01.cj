// EXEC: %compiler %cmp_opt %f  -o %output
// EXEC: %run %run_opt %output %run_args

class Foo {
    public prop var a: Int64 { // ok
        get() {
            return 0
        }
        set(v){}
    }

}
func main():Int64 {
    Foo().a = 1
    var x = Foo().a
    if ( x != 0) {
        return 1
    }
    return 0
}
