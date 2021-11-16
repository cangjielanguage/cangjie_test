// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

class A{}

func test<T>() where T <: Option<A>{

}

func main(){
    test<A>() // EXPECTED: regex generics type arguments do not match the constraint
    return 0
}