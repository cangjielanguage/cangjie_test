// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan exception_C
// ASSERT: scan-not exception_A
// ASSERT: scan-not exception_B
// ASSERT: scan-not exception_D

class X <: Resource {
    func isClosed(){throw A()}
    func close(){throw B()}
}

class Y <: Resource {
    func isClosed(){throw C()}
    func close(){throw D()}
}

class A <: Throwable {
    override func getMessage():String{ return "message_A\n"}
    override func toString() : String{ return "exception_A\n"}
}

class B <: Throwable {
    override func getMessage():String{ return "message_B\n"}
    override func toString() : String{ return "exception_B\n"}
}

class C <: Throwable {
    override func getMessage():String{ return "message_C\n"}
    override func toString() : String{ return "exception_C\n"}
}

class D <: Throwable {
    override func getMessage():String{ return "message_D\n"}
    override func toString() : String{ return "exception_D\n"}
}

func main() {
    try (a : X = X(), b: Y = Y()) // Y first.
    {
    } finally {}
    return 0
}
