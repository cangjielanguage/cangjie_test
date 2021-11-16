// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args



func test(): Int64 {
    var a : List<String> = ["a"]
    var b : List<String> = List<String>(["a"].toArray())
    var c : List<String> = List<String>(Array<String>(1,"a"))
    return a.size() + b.size() + c.size() - 3
}

func main(): Int64 {
    return test()
}
