// EXEC: %compiler %cmp_opt -c %f 2>&1 | compare %f
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

class Date {
    func foo() : Int32 {
        return 1
    }
    var a :Int32 = 1
    var b = this.foo()
    var c = this.foo
    init() {
        a = 10
        b = 20
        print("yes\n")
    }
}

func run(): Int64 {
    var date: Date = Date()
    if (date.a == 10){
        return 0
    }
    return 1
}

func main(): Int64 {
    return run()
}



