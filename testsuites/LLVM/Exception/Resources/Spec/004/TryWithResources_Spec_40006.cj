// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args  2>&1 | compare %f
// ASSERT: scan C!B!A!

class A <: Resource {
    func isClosed(){print("A!");true}
    func close(){}
}

class B <: Resource {
    func isClosed(){false}
    func close(){print("B!")}
}


class C <: Resource {
    func isClosed(){false}
    func close(){print("C!")}
}

func main() {
        try (a : A = A(),b : B = B(),c : C = C())
        {
        } finally {
        }
    return 0
}
