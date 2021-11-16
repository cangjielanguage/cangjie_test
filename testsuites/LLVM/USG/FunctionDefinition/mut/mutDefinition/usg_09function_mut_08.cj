// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// check capture this in mut function 
record Foo {
    var i = 0
    mut func f(): Foo {
        let f1 = { => this } // EXPECTED: regex 'this' cannot be captured in the mutable function 'f'
    }
}

func main(){
    var a = Foo()
    a.f()
    return 0
}