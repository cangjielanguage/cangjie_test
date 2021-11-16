// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

func test(){}

func main(){
test<Int32>() // EXPECTED: regex type argument's number does not match type parameter's number
}
