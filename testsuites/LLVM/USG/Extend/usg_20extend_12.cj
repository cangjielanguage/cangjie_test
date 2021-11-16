// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class Foo {}
extend Foo {
    private prop let v1: Int64 { // ok
        get() { 0 }
    }
    public prop let v2: Int64 { // ok
        get() { 0 }
    }
//    protected prop let v3: Int64 { // error
//        get() { 0 }
//    }
    prop let v4: Int64 { // default public
        get() { 0 }
    }
}
func main() {
    let a = Foo()
//    a.v1 // error, can not access private property
    a.v2 // ok
    a.v4 // ok
    return 0
}