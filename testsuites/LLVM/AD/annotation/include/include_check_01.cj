// EXEC-0: %compiler %enableAD %cmp_opt %f -o %output 

@differentiable[include:[]]
func abs(x:Float64){
    return if(x<=0.0){-x}else{x}
}

func main(){
    return 1
}