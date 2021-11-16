// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args



func test(): Int64 {
    var a : List<Bool> = [true]
    var b : List<Bool> = List<Bool>([true].toArray())
    var c : List<Bool> = List<Bool>(Array<Bool>(1,true))
    return a.size() + b.size() + c.size() - 3
}

func main(): Int64 {
    return test()
}
