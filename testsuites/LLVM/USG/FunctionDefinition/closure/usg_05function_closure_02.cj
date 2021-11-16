// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

let x = 4
func f() {
    print("${x}") // Print 4.
    let x = 99
    func f1() {
        print("${x}")
    }
    let f2 = {
        print("${x}")
    }
    f1() // Print 99.
    f2() // Print 99.
}

func main() {
    f()
    return 0
}

