// ERRCHECK: %compiler %cmp_opt %f -o %output

class A{
    static operator func ()(){}
}

interface B {
    static operator func ()(){}
}

class C <: B {}

record D {
    static operator func ()(){}
}

func main(){
    A() // init A
    B() // EXPECTED: regex interface 'B' can not be instantiated
    D() // init D
    return 0
}