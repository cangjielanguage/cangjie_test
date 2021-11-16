// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args



func test(): Int64 {
    var a : List<Char> = ['0']
    var b : List<Char> = List<Char>(['0'].toArray())
    var c : List<Char> = List<Char>(Array<Char>(1,'0'))
    return a.size() + b.size() + c.size() - 3
}

func main(): Int64 {
    return test()
}
