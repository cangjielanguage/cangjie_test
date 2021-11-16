// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// check using mut for a operator
record A {
    mut operator func +(rhs: A): A { // EXPECTED: regex modifiers 'mut' and 'operator' are conflict in function declaration
        return A()
    }
}

func main(){
    var a = A()
    a.f()
    return 0
}