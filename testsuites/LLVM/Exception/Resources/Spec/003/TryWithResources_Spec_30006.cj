// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan YYYYXXXX

class X <: Resource {
    func isClosed(){false}
    func close(){print("XXXX")}
}

class Y <: Resource {
    func isClosed(){false}
    func close(){print("YYYY")}
}

func main() {
    try (a : X = X(), b: Y = Y()) // Y first.
    {
    } finally {}
    return 0
}
