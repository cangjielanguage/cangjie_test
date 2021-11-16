// EXEC:%compiler %frontend %typecheck %cmp_opt %f 2>&1 | compare %f

func test<T>(input:Int64){ // ASSERT: regex-auto unable to infer function return type, please write it
    func test(a:T){}
    test(1)
}

func main():Int64{
    return 0
}