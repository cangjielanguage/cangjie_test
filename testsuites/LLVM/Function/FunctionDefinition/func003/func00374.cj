// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
func returnAdd() {
        return { a: Int64, b: Int64 => a + b}
}

func main(): Int64 {
    var add = returnAdd()
    return add(0,0)
}
