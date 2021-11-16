// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class A{
    var x = 1
}

class B{
    var x : A = A()
}

class C {
    var x : B = B()
}


func main(): Int64 {
    let c = C()
    let c1 : ?C = C()
    let r1 : ?A = c1?.x?.x
    return 0
}
