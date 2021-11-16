// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan true

func test<T>(input:T,flag:Bool){
    if (flag) {
        print("true")
        return
    }
    func test(a:T,flag:Bool){print("inside")}
    test<T>(input,true)
    return
}

func main():Int64{
    test<Int64>(1,false)
    return 0
}