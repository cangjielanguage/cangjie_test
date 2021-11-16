// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class Foo {}

extend Foo {
    func f() {
        print("Hello World!\n")
    }
}

func main() {
    let a = Foo()
    a.f()
    return 0
}