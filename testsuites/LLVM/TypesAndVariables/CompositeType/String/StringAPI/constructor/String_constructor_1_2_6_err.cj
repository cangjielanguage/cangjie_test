// EXEC:%compiler %frontend %typecheck %cmp_opt %f 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

func run(): Int64 {
        

    var c2 : Array<Char> = Array<Char>(['A','a','B','b','f','F'])

    
    var s22: String = String(c2).substring(2,9223372036854775808) // EXPECTED: regex the number '9223372036854775808' exceeds the value range of type 'Int64'
    
    print(s22+"\n")
    
return 0
}

func main(): Int64 {
    return run()
}
