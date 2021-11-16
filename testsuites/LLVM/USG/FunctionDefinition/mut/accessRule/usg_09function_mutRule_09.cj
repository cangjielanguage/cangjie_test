// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

// check mut function call in interface
interface I {
    mut func f(): Unit {
        g()
    }
    func g(): Unit {
    }
}

func main() {
    return 0
}