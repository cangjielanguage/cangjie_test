// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan 12


class A{
    var b : Int64 = 0
}

func main(){
    var a : ?A = A()
    a?.b = sourceLine()
    print("${a?.b??0}")
    return 0
}