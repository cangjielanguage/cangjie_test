// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan flag is
// we do not care flag`s number.

var flag = 0



func foo():Unit{flag +=1 ; try {throw Exception()} catch(_){}finally{}}

class A{
    ~init(){foo()}
}

func test(){
    var a = A()
}

func main(){
    test()
    NativeGC()
    print("flag is ${flag}")
    return 0
}