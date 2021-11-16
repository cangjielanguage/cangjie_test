// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

record Foo {
    var i = 0
    mut func f() {
        this.i += 1 // ok
        i += 5 // ok
        print(i.toString())
    }
}

func main(){
    Foo().f()
    return 0
}
