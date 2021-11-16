// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

open class A{
    operator func ()(){1}
    operator func ()(input:Int64){2}

}

class B <: A{
    operator func ()(input:Int32){3}
    func test(){
        var b = B()
        return b() + b(1) - 3
    }
}

func main(){
    var a : B = B()
    return a.test()
}