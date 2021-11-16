// ERRCHECK: %compiler %cmp_opt %f -o %output

var flag = 0

class A{
    unsafe ~init(){flag+=1} // EXPECTED: regex modifier is not allowed here
}

func test(){
    var a = A()
}

func main(){
    test()
    print("flag is ${flag}.")
    NativeGC()
    sleep(200*1000*1000)
    print("flag is ${flag}.")
    return 0
}