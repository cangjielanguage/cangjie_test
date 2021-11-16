// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args
@c
record UnsafePtr {
    private var address : Int64 = 0
}

foreign func unsafePointerCast1(ptr:UnsafePtr): String
foreign func unsafePointerCast2(ptr:String): UnsafePtr

func FuncFromC():Int64{
  var input = "a"
  var ptr = unsafe { unsafePointerCast2(input) }
  var str = unsafe { unsafePointerCast1(ptr) }
  if (str == "a") {
    return 0
  }
  return 1
}


func main():Int64 {
  return FuncFromC()
}
