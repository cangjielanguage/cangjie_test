// EXEC: %compiler %cmp_opt %n.cj -o %output
// EXEC: %run %run_opt %output %run_args

record Test1 {
    func foo(): Int32 {
      return 1
    }
}

record Test2 {
    var b: () -> Int32 = Test1().foo
}

let res = Test2().b()

func run(): Int64 {
    if (res == 1) {
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}

