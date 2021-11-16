// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// block表达式++，语法支持，语义报错，因为B022中blockexpress不能做左值
func main(): Int64 {
    {
        var a:Int8 = 1
        a
    }.++ // EXPECTED: regex error.*?expected identifier here
    return 0;
}