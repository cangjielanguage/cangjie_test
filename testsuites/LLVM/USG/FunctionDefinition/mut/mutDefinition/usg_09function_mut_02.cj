// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// check using mut and static for the same function
record A {
    mut static func f():Unit{print("this is record A")} // EXPECTED: regex modifiers 'static' and 'mut' are conflict in function declaration
}

func main(){
    var a = A()
    a.f()
    return 0
}