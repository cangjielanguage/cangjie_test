// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT: scan value = 1
// ASSERT: scan-not It was None

class X {
    var value = 1
}

func createX(): ?X {
    X()
}

func test(x: ?X): Unit {
    print("start of test\n")
    match(x) {
        case Some(v) => print("value = " + v.value.toString() + "\n")
        case $None => print("It was None\n")
    }
    print("end of test\n")
}

func main(): Int64 {
    print("before test\n")
    var x : ?X = X()
    test(x)
    test(createX())
    print("after test\n")
    return 0
}
