// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
@c
record UnsafePtr {
    private var address : Int64 = 0
}

foreign func unsafePointerCast1(ptr:UnsafePtr): String
foreign func unsafePointerCast2(ptr:UnsafePtr): String
foreign func unsafePointerCast3(ptr:UnsafePtr): String
foreign func unsafePointerCast4(ptr:String): UnsafePtr
foreign func unsafePointerCast5(ptr:String): UnsafePtr
foreign func unsafePointerCast6(ptr:String): UnsafePtr


func FuncFromC():Int64{
  var input = "a"
  var a = unsafe { unsafePointerCast6(input) }
  var b = unsafe { unsafePointerCast3(a) }
  var c = unsafe { unsafePointerCast5(b) }
  var d = unsafe { unsafePointerCast2(c) }
  var e = unsafe { unsafePointerCast4(d) }
  var f = unsafe { unsafePointerCast1(e) }
  if (f == "a") {
    return 0
  }
  return 1
}


func main():Int64 {
  return FuncFromC()
}
