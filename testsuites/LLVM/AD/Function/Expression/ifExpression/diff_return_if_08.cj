// EXEC:%compiler %cmp_opt %enableAD %n.cj -o %n.out

@differentiable [except: [y]]
func f(x: Float64, y: Bool)  {
    if (y){
        x
    } else{
        (-x) * x
    }
}

@differentiable [except: [y]]
func g(x: Float64, y: Bool)  {
    if (y){
        x
    } else{
        x * x
    }
  
}

@differentiable [except: [y]]
func foo(x: Float64, y: Bool) : Float64 {
    if (y) {
        f(x, y)
    } else {
        g(x, y)
    }
}

func main() {
  return 0
}