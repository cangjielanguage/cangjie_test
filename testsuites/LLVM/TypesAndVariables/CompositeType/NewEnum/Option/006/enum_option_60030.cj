// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args



class C{
    var d : Int64 = 1
}


func test():Option<Int64>{
    var c : ?C = C()
    var x : ??Int64 = c?.d
    return Some(0)
}

func main(): Int64 {
    return test() ?? 1
}
