// EXEC: %compiler %frontend %typecheck %cmp_opt %f 2>&1 | compare %f

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

interface ToString {
    func toString() : String
}

extend student <: ToString {
    func toString() : String {
        return this.name
    }
}

func main(): Int64 {
var zhy: student =student("charl")
print("${zhy}")  // EXPECTED: regex the type 'Class-student' should implement interface 'ToString' in the 'core' package
return 0
}


// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace