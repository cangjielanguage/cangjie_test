// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex type alias

type void<T> = Unit

func foo(): void<Int8> {
    print("type alias")
}

func main(): Int64 {
    foo()
    return 0
}