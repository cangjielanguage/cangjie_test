// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args| compare %f
// ASSERT: regex helloworld
class student{
    var name=""
    init(sname:String){
    this.name=sname
    }

    func combine (a:String,b:String) :String
    {
    return (a+b)
    }

}

func main(): Int64 {
var zhy: student =student("charl")
print("${zhy.combine("hello","world")}")
return 0
}


// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace