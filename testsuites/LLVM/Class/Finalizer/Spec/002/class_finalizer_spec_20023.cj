// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

var flag = 0

class A{
    var x : String
    init(i:String){x = i}
    ~init(){print("${flag}\n");flag+=1}
}

func test(){
    var a = A("a")
    var b = A("b")
}

func main(){
    while (true){
        test()
        if (flag != 0){
            break
        }
    }
    print("${flag}\n")
    return 0
}