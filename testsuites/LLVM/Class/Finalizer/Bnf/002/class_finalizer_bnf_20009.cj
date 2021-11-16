// ERRCHECK: %compiler %cmp_opt %f -o %output
class A{
    ~A(){} // EXPECTED: regex illegal class member in class block
}


func test(){
    var a = A()
}

func main(){
    test()
    NativeGC()
    return 0
}