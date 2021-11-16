// EXEC-0: %compiler %enableAD %cmp_opt %f -o %output


class A {
    @differentiable[except: [this, y]]
    func foo(x:Float64, y : Float64){
        return (x,y)
    }
}


func main(){
    return 0
}