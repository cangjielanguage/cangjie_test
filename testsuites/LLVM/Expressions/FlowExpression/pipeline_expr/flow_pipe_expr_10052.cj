// ERRCHECK: %compiler %cmp_opt %f -o %output


class A{
    init(input:Int64){}
    init(){
        1|>this  // EXPECTED: regex-auto 'this' is not allowed to be used in flow expressions
    }
}

func main(): Int64 {
    A()
    return 0
}
