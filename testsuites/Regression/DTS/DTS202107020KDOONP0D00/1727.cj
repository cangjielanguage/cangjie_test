// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

interface A{}

func test<T>(a:T){
    a is A
}

func main() {
    return 0
}
