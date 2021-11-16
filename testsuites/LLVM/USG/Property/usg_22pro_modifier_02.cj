// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class Foo {
    public static prop let c: Int64 {
        get() { return 0 }
    }
}

func main() {
    var ret = Foo()
    if ( Foo.c != 0 ) {
        return 1
    }
    return 0
}