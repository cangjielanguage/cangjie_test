// ERRCHECK: %compiler %cmp_opt %f -o %output

foreign{
class A{
    ~init(){} // EXPECTED: regex foreign function can not have body
}
}

func main(){
    var a = A()
    return 0
}