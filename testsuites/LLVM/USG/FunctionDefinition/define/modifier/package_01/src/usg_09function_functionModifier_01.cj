// DEPENDENCE: ../src ../test.cfg
// EXEC: %compiler %cmp_opt -c ./src/pkge/pkge.cj -o pkge.%middle
// EXEC: %compiler %cmp_opt %f -import-config  test.cfg pkge.%middle -o %output
// EXEC: %run %run_opt %output %run_args
import pkge.*

func main() : Int64{
    let a = a()
    print("_test")
    return a
}