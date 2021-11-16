// DEPENDENCE: ../src ../test.cfg
// EXEC: %compiler %cmp_opt -c ./src/pkge/pkge.cj -o pkge.%middle
// EXEC: %compiler %cmp_opt %f -import-config  test.cfg pkge.%middle -o %output 2>&1 |compare %f
import pkge.*

func main() : Int64{
    let a = a() // EXPECTED: regex undeclared identifier 'a'
    print("_test") 
    return 0
}
