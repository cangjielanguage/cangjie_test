// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan expression of Nothing type cannot appear here currently

class A <: Exception{}

func test():Unit{throw (throw A())}

func main(){
    test()
    return 0
}