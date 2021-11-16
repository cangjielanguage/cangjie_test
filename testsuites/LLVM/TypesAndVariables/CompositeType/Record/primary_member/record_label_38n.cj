// EXEC: %compiler %cmp_opt %n.cj -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace


func main(): Int64 {
  return run()
}

record Data {
  var width3: Int32 = 1
  var length3: Int32 = 2
  var perimeter3 : () -> Int32= {  => 2 * (width3 + length3)}
  Data(x: Int32, y: Int32, z: () -> Int32) {
  }
}

func run(): Int64 {
  var res: Int32
  let a: Int32 = 5
  var b: Int32 = 6
  var c: () -> Int32 = {  => a}
  let data = Data(a, b, c)
  res = data.perimeter3()
  return 0
}
