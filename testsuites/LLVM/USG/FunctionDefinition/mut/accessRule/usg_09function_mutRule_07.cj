// EXEC: %compiler %cmp_opt %f -o %output  2>&1 | compare %f

// check call a mut function in a function
record Foo {
    var i = 0
    mut func f(): Unit {
        print("this is function f") 
    }
    func g(): Unit {
        f() // EXPECTED: regex immutable function 'g' cannot access mutable function 'f'
    }
}

func main() {
    var a = Foo()
    a.g()
    return 0
}