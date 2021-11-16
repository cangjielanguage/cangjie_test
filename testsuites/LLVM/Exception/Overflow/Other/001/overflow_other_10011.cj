// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan success


@overflowSaturating
func test(){
    func a(){var x : Int8 = 100;x+x}
    return a()
}

func main(){
    var res = Int64(test() - 127)
    print("success")
    return res
}
