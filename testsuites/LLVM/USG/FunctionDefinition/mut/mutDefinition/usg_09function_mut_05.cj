// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// check mut function in class
class A {
    mut func f(): Unit {print("this is a class A")} // EXPECTED: regex 'mut' modifier is illegal for function declaration in class body
}

func main(){
    var a = A()
    a.f()
    return 0
}