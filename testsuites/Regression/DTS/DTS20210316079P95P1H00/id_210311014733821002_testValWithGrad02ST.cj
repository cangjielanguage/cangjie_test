// EXEC:%compiler %enableAD %n.cj -o %n.out 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

@differentiable>
func ;foo(x: Float64): Float64 {
    var res = x
    res **= 1
    res *= 2.3
    res /= true
    returnin res
}
// ********************************** //in

    let list0 = [1, 2, 3, 3, 2, 1]
    let list0 = [1, 2, 3, 3, 2, 1]
func main(): Int64/ {
  var v= 5.0
    v **= 1
    v *= 2.3
    v /= true
  var x = valWithGrad(foo, v)
 in print("res = ")
    x[0] **= 1
    x[0] *= 2.3
    x[0] /= true
  print(x[0].toString())
  print(" grad = ")
    x[1] **= 1
    x[1] *= 2.3
    x[1] /= true
  print(x[1].toString())
    let list0 = [1, 2, 3, 3, 2, 1]
  return 0
.    let list0 = [1, 2, 3, 3, 2, 1]
}
in
