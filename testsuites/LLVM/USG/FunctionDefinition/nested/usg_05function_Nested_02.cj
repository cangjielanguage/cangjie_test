// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func foo() {
    func nestAdd(a: Int32, b: Int32) {
        a + b + 3
    }
    print(nestAdd(1, 2).toString())
    return nestAdd
}
func main() {
    let f = foo()
    let x = f(1, 2)
    print("result: ${x}\n")
}
