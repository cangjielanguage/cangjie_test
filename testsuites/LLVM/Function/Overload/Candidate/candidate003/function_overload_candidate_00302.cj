// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

class A{}
class B{}
class C{}

func test(a:A,b!:B=B()):Int64{return 1}
func test(a:C):Int64{return 2}



func main():Int64{
    if (test(A()) != 1) {
        return 1
    }
    return 0
}
