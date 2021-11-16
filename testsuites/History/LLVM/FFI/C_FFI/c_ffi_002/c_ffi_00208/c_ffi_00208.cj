// DEPENDENCE: %n.c
// EXEC: %clang -c %n.c -o lib%n.o
// EXEC: %compiler %cmp_opt %f lib%n.o -o %output
// EXEC: %run %run_opt %output %run_args
@c
record UnsafePtr {
    private var address : Int64 = 0
}

foreign func GetMaxFuncPtr(): UnsafePtr
foreign func unsafePointerCast(ptr:UnsafePtr):(Int8, Int8, UInt8, Int16, UInt16, Int32, Int32, UInt32, Int64, UInt64, Float32, Float64, Bool, Char) -> Int32

func FuncFromC():Int64{
  var ptr = unsafe { GetMaxFuncPtr() }
  var Max = unsafe { unsafePointerCast(ptr) }
  var a : Int8 = 0
  var b : Int8 = 0
  var c : UInt8 = 0
  var d : Int16 = 0
  var e : UInt16 = 0
  var f : Int32 = 0
  var g : Int32 = 0
  var h : UInt32 = 0
  var i : Int64 = 0
  var j : UInt64 = 0
  var k : Float32 = 0.0
  var l : Float64 = 0.0
  var m : Bool = false
  var n : Char = 'a'
  Max(a,b,c,d,e,f,g,h,i,j,k,l,m,n)
  if (a == 1) {return 1}
  if (b == 1) {return 2}
  if (c == 1) {return 3}
  if (d == 1) {return 4}
  if (e == 1) {return 5}
  if (f == 1) {return 6}
  if (g == 1) {return 7}
  if (h == 1) {return 9}
  if (i == 1) {return 10}
  if (j == 1) {return 11}
  if (k == 1.0) {return 12}
  if (l == 1.0) {return 13}
  if (m == true) {return 14}
  if (n == 'b') {return 15}
  return 0
}


func main():Int64 {
  return FuncFromC()
}
