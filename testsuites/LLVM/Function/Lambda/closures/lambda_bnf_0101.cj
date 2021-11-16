// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: regex-not core dump

func main():Int64 {
    return 0
}

func case01(){
    var a = { a: Int64;b:Int32 => } // EXPECTED: regex error.*?expected '=>' in the lambda function
    var b = a(1)
    return b
}


func case02(){
    var a = { a => a} // EXPECTED: regex error.*?parameters of this lambda expression must have type annotations
}

func case03(){
    var a = { a:Int32 } // EXPECTED: regex error.*?expected '=>' in the lambda function
}