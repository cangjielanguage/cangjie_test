// ERRCHECK: %compiler %cmp_opt %f -o %output


class A{
    operator func ()(input:A){}
    init(a:A){}
    init(a:String){
        this |> this // EXPECTED: regex-auto 'this' is not allowed to be used in flow expressions
    }
}

func main(): Int64 {
    A("1")
    return 0
}
