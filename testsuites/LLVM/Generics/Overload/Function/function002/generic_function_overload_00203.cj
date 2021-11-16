// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT:scan generic

func test(a:Int64){print("normal")}
func test<T>(a:T,b:T){print("generic")}

func main():Int64{
    test<Int32>(1,1)
    return 0
}