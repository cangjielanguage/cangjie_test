// EXEC-PIPE-1: %compiler %enableAD %cmp_opt %f -o %output 2>&1 | compare %f

let temp = 1.0

@differentiable[include: [temp]]
func foo(x:Float64, y : Float64){  //EXPECTED :regex-auto 'temp' is not found in parameter list
    return (x,y)
}



func main(){
    return 0
}