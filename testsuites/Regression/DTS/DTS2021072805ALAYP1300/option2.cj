// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan 1
// ASSERT: scan-not exception

class X {
    var value = 1
}

func createX(): ?X {
    X()
}

func main(): Int64 {
    print(createX().getOrThrow().value.toString() + "\n")
    return 0
}
