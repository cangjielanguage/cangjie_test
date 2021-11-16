// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class A{
    operator func ()(){}
}

interface B {
    operator func ()(){}
}

class C <: B {}

record D {
    operator func ()(){}
}

func main(){
    var a : A = A()
    var b : B = C()
    var c : D = D()
    a()
    b()
    c()
    return 0
}