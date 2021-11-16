// EXEC-0: %compiler %cmp_opt %enableAD %n.cj -o %n.out

class A{
    var a : Float64 = 1.0
    var b : Float64 = 2.0
    @differentiable[except:[this]]
    func foo(x:Float64, y:Float64){
        var temp = 1.0
        var index: Float64 = x
        do{
            index = index - this.b
            temp = temp + this.b
        } while(stopGradient<Float64>(x) > 100.0)

        return temp
    } 
}  

func main(){
    return 0
}