// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT:scan generic

func test<T>(a:T){
    print("generic")
}


func main():Int64{
    func test(a:Int64){
        print("normal")
    }
    test<Int64>(1)
    return 0
}