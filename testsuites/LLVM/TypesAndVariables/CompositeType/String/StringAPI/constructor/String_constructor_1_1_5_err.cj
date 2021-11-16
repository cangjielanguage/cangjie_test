// EXEC:%compiler %frontend %typecheck %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func run(): Int64 {
        
    var c6: RefArray<Char> = RefArray<Char>(['仓','颉','b','f','F','3','7','9'])
    //报错，比边界值9223372036854775808大1
    var s6: String = String(c6).substring(9223372036854775809) // EXPECTED: regex the number '9223372036854775809' exceeds the value range of type 'Int64'
    
    
return 0
}

func main(): Int64 {
    return run()
}

