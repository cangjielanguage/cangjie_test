// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class A{}

func test<T>() where T <: ?A{

}

func main(){
    test<?A>()
    return 0
}