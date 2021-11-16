// ERRCHECK: %compiler %cmp_opt %f -o %output

var flag = 0

class A{
    func test(){}

}

extend A{
    ~init(){flag+=1} // EXPECTED: regex illegal class member in extend block
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