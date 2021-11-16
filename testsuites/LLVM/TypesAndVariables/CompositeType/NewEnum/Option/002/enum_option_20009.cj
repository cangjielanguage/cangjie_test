// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class A{}

func test<T>() where T <: ?Int64{

}

func main(){
    test<?Int64>()
    return 0
}