// EXEC:%compiler %cmp_opt %enableAD %n.cj -o %n.out

class A {
  var a : Float64
  var b : Float64
  init(){
    a = 1.0
    b = -1.0
  }

  @differentiable[except:[this]]
  func foo(x:Float64, y:Float64){
    if (a > 0.0){
      x
    } else{
      y
    }
  }
}

func main() {
  return 0
}