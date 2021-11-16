// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args| compare %f
// ASSERT: regex charl
class student <: ToString {
    var name = ""
    init(name: String) {
        this.name = name
    }

    func combine(a: String, b: String): String {
        return (a + b)
    }

    func toString(): String {
        return this.name
    }
}

func main(): Int64 {
    var zhy: student = student("charl")
    print("${zhy}")
    return 0
}


// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace