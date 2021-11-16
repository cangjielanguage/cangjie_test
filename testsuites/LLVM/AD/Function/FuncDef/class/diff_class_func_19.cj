// EXEC-0: %compiler %enableAD %cmp_opt %f -o %output 

interface A{
    func a(){}
}
open class C {
    @differentiable[except:[this]]
    open func a() {}
}
class B <: C & A{
    
    override func a(){}
}
func main(){
    return 0
}