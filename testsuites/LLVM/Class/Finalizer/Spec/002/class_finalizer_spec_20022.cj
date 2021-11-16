// EXEC: %compiler %cmp_opt %f -o %output
// EXEC-PIPE-0: %run %run_opt %output %run_args | compare %f
// ASSERT: scan end!

var flag = 0

class A{
    ~init(){flag+=1}
}


func test(){
    var a = A()
}

func main(){
    while (true){
        test()
        if (flag != 0){ // GC happened
            break
        }
    }
    print("end!\n")
    print("${flag}\n")
    return 0
}