// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args


func run(): Int64 {
    var a: Int64 = #"Hello
Char \nLang"#.size()
    print(a.toString())
    if(a == 17) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}
