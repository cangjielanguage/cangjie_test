// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func returnAddNum(): (Int64)->Int64 {
    let num: Int64 = 10
func add(a: Int64) {
    return a + num
}
    add
}
func main() {
    let f = returnAddNum()
    print("${f(10)}") // return 20
}
