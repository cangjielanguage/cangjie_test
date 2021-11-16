// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func hello(): Unit {
    print("Hello!")
}

func main(){
    hello()
    return 0
}
