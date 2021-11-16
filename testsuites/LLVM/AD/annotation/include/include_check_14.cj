// EXEC-0: %compiler %enableAD %cmp_opt %f -o %output


class A {
    @differentiable[include: [x]]
    func foo(x:Float64, y : Float64){
        return (x,y)
    }
}


func main(){
    return 0
}