// EXEC-0: %compiler %enableAD %cmp_opt %f -o %output 2>&1 | compare %f

@differentiable[include:[x,x]] // EXPECTED : regex-auto find a duplicate identifier 'x'
func foo(x:Float64){
    return 1.0
}

func main(){
    return 0
}