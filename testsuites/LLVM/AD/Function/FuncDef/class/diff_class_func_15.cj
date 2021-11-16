// EXEC-0: %compiler %enableAD %cmp_opt %f -o %output

interface A{
    func a(){}
}
open class C {
    open func a() {}
}
class B <: C & A{
    @differentiable[except:[this]]
    override func a(){}
}
func main(){
    return 0
}