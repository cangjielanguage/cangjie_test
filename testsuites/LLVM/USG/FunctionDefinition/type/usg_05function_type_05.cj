// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args


func add(a: Int32, b: Int32): Int32 {
    a + b
}

func printAdd(add: (Int32, Int32) -> Int32, a: Int32, b: Int32): Unit {
    print("${add(a, b)}")
}

func main(){
    printAdd(add,2,3)
    return 0
}
