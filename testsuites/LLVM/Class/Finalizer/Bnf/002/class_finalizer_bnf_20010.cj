// ERRCHECK: %compiler %cmp_opt %f -o %output
class A{
    func test(){
        ~init(){} // EXPECTED: regex '~' is not allowed in block, expected expression or declaration here
    }
}


func test(){
    var a = A()
}

func main(){
    test()
    NativeGC()
    return 0
}