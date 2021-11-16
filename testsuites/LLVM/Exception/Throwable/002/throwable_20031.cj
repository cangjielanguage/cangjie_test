// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

enum B{
    b
    func test(){
        return 0
    }
}

func main() {
    B.b.test()
}
