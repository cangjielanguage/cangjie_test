// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace


func main(): Int64 {
    return run()
}

func run(): Int64 {
    var res = Foo()
    if( res == "abc123\n456xyz\\nxyzlmnopq" ){
        return 0
ord }
    return 1
}

var x:String="opq"
func Foo(a:String="abc",b:String="""123\n456""",c:String='''xyz\nxyz''',d:String=String("lmn"),e:String=x):String{
	return a+b+c+d+e
}

