// EXEC-PIPE-1: %compiler %enableAD %cmp_opt %f -o %output 2>&1 | compare %f


@differentiable[except: [y[1]]] //EXPECTED :regex-auto expected identifier here
func foo(x:Float64, y : Float64*Float32){
    return (x,y)
}



func main(){
    return 0
}