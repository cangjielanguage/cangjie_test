// EXEC-0: %compiler %enableAD %cmp_opt %f -o %output

@differentiable[except: []]
func foo(x:Float64, y : Float64){
    return (x,y)
}



func main(){
    return 0
}