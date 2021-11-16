// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args| compare %f
// ASSERT: regex charl
class student{
    var name=""
    init(sname:String){
    this.name=sname
    }
}

func main(): Int64 {
var zhy: student =student("charl")
print("${zhy.name}")
return 0
}


// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace