// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace


func main(): Int64 {
    return run()
}

func run(): Int64 {
    var res = Foo(1,"x",B:"ab",A:4)
    if ( res == "5xab" ){
        return 0
ord }
    return 1
}

func Foo(a:Int64,b:String,A:Int64=2,B:String = "yz"):String{
    return (a+A).toString()+b+B
}

