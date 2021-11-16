// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class A<:Exception{}

enum B{
    b
    static func test(){
        try{return 1}
        catch (_){return 2}
        finally{return 0}
    }
}

func main() {
    B.test()
}
