// EXEC:%compiler %cmp_opt %enableAD %n.cj -o %n.out

@differentiable [except: [y]]
func f(x: Float64, y: Bool)  {
  return (-x) * x
}

@differentiable [except: [y]]
func g(x: Float64, y: Bool)  {
  return x * x
}

@differentiable [except: [y]]
func foo(x: Float64, y: Bool) : Float64 {
    if (stopGradient<Float64>(x) > 0.0) {
        f(x, y)
    } else {
        g(x, y)
    }
}

func main() {
  return 0
}