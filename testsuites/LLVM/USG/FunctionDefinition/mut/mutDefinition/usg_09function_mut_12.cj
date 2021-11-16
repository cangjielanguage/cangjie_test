// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// check 'this' to be used as an expression in the mutable function
record Foo {
    var i = 0
    mut func f(): Foo {
        return this // EXPECTED: regex 'this' cannot be used as an expression in the mutable function 'f'
    }
}

func main(){
    var a = Foo()
    a.f()
    return 0
}