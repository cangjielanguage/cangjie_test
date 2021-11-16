// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex IndexOutOfBoundsException

func main() {
    func a<b>() where b <: List<Char> {
        var xx : List<List<Char>> = [[]]
        xx[0][2]
    }
    a()
    0
}
