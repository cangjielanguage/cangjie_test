// EXEC-0: %compiler %enableAD %cmp_opt %f -o %output

@differentiable[include: [x,y]]
func foo(x:Float64, y : Float64){
    return (x,y)
}



func main(){
    return 0
}