// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT:scan generic

func test<T>(a:T,flag:Bool){
    if (flag) {
        print("generic")
        return
    }
    func test(a:Int64,b:Int64){
        print("normal")
    }
    test(true,true)
    return

}


func main():Int64{
    test<Int64>(1,false)
    return 0
}