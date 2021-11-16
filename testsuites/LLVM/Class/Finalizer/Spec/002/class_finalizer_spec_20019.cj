// ERRCHECK: %compiler %cmp_opt %f -o %output

var flag = 0

class A{
    open func test(){}
    ~init(){flag+=1} // EXPECTED: regex finalizer is forbidden in class 'A' that is open
}

class B <: A{}

func test(){
    var a = B()
}

func main(){
    test()
    print("flag is ${flag}.")
    NativeGC()
    sleep(200*1000*1000)
    print("flag is ${flag}.")
    return 0
}