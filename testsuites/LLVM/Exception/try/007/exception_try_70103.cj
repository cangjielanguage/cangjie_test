// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan the object thrown must derive from `core.Throwable`

class A <: Exception{}

func test():Unit{throw throw A()}

func main(){
    test()
    return 0
}