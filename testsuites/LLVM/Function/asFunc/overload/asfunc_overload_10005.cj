// ERRCHECK: %compiler %cmp_opt %f -o %output

class A{
    operator func ()(){1}
    operator func ()(input:Int64){2}
    operator func ()(input:Int32){3}
}


extend A {
    operator func ()(){4} // EXPECTED: regex extend member '\(\)' is not allowed to shadow members of 'Class-A'
    operator func ()(input_b:Int64){5}
    operator func ()(input_b:Int32){6}
}

func main(){
    var a : A = A()
    return a() + a(1) - 3
}