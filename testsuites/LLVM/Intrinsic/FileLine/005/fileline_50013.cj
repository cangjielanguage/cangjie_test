// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan 7


interface A{
    func test(){var a = sourceLine();return a}
}

class B <:A{

}

func main(){
    print("${B().test()}")
    return 0
}