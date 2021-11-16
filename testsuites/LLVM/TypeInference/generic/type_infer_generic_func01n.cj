// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump
// ASSERT: regex-not stack trace

// 无法用()->来标示泛型函数，也就是泛型函数无法用类型表示，所以变量被赋值为一个泛型函数不能推导出泛型函数中的类型变元的类型
func test_function(){
    var a:<Int32>()->Unit = aoo1<Int32> // EXPECTED: regex error.*?expected type
}

func run():Int64{
    test_function()
    return 0
}
func main(): Int64 {
    return run()
}


