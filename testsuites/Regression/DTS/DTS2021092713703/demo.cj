// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

external open class Class313 <: Interface314<Result<UInt64>> & Interface315 {
        func func419() : Unit { // block id: 420
        }
}

external interface Interface314<T0> {
    func func419() : Unit
}

external interface Interface315 <: Interface314<Result<UInt64>> {
}

func main(): Int64 {
    return 0;
}
