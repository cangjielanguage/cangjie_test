// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class A{
    var x = 0
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
    return c1?.x?.x?.x??1
}
