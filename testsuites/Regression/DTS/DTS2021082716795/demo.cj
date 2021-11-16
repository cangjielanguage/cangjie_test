// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

func main() : Int64 {
    0
}

interface Interface8<T0> where T0 <: List<List<(Int64 * Int64)>> {
    func func641() : Unit {
        let var653 : List<(Int64 * Int64 * Int64 * Int64)> = [(Int64(0), Int64(0), Int64(0), Int64(0))];
        var653[0][3]
    }
}

interface Interface9 <: Interface8<List<List<(Int64 * Int64)>>> {
}
