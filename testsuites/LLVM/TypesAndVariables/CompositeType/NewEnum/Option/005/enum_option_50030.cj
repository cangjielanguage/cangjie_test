// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


class A{
    var b : Option<Option<Int64>> = Some(Some(1))
}

class C{
    var d : Option<Int64> = Some(1)
}


func test():Option<Int64>{
    var a : ?A = A()
    var c : ?C = C()
    a?.b??c?.d
    return Some(0)
}

func main(): Int64 {
    return test() ?? 1
}
