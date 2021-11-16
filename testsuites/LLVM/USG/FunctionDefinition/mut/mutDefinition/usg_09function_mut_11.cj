// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// check capture a var in mut function
record Foo {
    var i = 0
    mut func f(): Foo {
        let f4 = { => i } // EXPECTED: regex 'i' cannot be captured in the mutable function 'f'
    }
}

func main(){
    var a = Foo()
    a.f()
    return 0
}