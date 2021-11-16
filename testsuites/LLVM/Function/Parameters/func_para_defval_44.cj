// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args


func main(): Int64 {
    return run()
}

func run(): Int64 {
    if (Foo() == false){
        return 0
    }
    return 1
}


func Foo(a!: Bool = !true && true || false):Bool{
    return a 
}
