// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args | compare %f
// ASSERT:scan thirdsecond

func first():Int64  {print("first");return 1}
func second():?Int64{print("second");return 2}
func third():??Int64{print("third");return Option<Option<Int64>>.None}

func main(): Int64 {
    var b = third() ?? second() ?? first()
    return (b ?? 0) - 2
}
