// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan exception_B
// ASSERT: scan-not exception_A

class X <: Resource {
    func isClosed(){false}
    func close(){throw A()}
}

class Y <: Resource {
    func isClosed(){false}
    func close(){throw B()}
}

class A <: Throwable {
    override func getMessage():String{ return "message_A\n"}
    override func toString() : String{ return "exception_A\n"}
}

class B <: Throwable {
    override func getMessage():String{ return "message_B\n"}
    override func toString() : String{ return "exception_B\n"}
}


func main() {
    try (a : X = X(), b: Y = Y()) // Y first.
    {
    } finally {}
    return 0
}
