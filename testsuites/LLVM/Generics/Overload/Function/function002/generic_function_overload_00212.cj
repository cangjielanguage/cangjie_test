// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT:scan normal

func test<T>(a:T,flag:Bool){
    if (flag) {
        print("generic")
        return
    }
    func test(a:Bool,b:Bool){
        print("normal")
    }
    test(true,true)
    return
}


func main():Int64{
    test<Int64>(1,false)
    return 0
}