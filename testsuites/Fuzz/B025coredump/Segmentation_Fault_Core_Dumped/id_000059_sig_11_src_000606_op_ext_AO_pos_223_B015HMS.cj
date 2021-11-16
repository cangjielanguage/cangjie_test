// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace


func main(): Int64 {
    return run()
}

func run(): Int64 {
    var res = Foo<Int64>(1,"x",3)
    if ( res == "3xyz" ){
        return 0
ord }
    return 1
}

func Foo<T>(a:Int64,b:String,t:T,A:Int64=2,B:String = "yz"):String{
    return (a+A).toString()+b+B
}

