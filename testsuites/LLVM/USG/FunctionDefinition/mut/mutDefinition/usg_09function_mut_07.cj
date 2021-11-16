// EXEC: %compiler %cmp_opt %f -o %output 
// EXEC: %run %run_opt %output %run_args

// check this in mut function
record Foo{
    var i = 0
     mut func f() {
        this.i += 1
        i += 1
        return i
    }
}

func main(){
    var a = Foo()
    let x = a.f() - 2
    return x
}