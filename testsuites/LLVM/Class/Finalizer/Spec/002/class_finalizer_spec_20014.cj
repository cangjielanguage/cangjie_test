// ERRCHECK: %compiler %cmp_opt %f -o %output

var flag = 0

class A{
    ~init(){flag+=1}
}

func test(){
    var a = A()
    a.init() // EXPECTED: regex-auto '<invalid identifier>' is not a member of class 'A'
}

func main(){
    test()
    print("flag is ${flag}.")
    NativeGC()
    sleep(200*1000*1000)
    print("flag is ${flag}.")
    return 0
}