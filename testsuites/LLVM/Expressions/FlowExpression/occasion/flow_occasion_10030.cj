// ERRCHECK: %compiler %cmp_opt %f -o %output


func a(input:Int64):Int64{input}

open class A{
    operator func ()(){}
    operator func ()(input:Int64){}
    operator func ()(input:(Int64)->Int64){}
}

class B <: A{
    init(){
        super() // init for super
        super(1|>a) // EXPECTED: regex no matching function declaration for function call
        super(a~>a) // EXPECTED: regex no matching function declaration for function call
    }
}


func main(): Int64 {
    return 0
}
