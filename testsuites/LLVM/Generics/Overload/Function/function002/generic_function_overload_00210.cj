// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT:scan normal

func test<T>(a:T){
    print("generic")
    func test(a:Int64){
        print("normal")
    }
    test(1)
}


func main():Int64{
    test<Int64>(1)
    return 0
}