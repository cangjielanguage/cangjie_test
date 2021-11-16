// DEPENDENCE: %n.c cfg.json
// EXEC: sed -i "s!cangjieCFFI_path!%cstring_cjo!g" cfg.json
// EXEC: %clang %clang_opt %n.c -o %cffi_output
// EXEC: %compiler %cmp_opt %ffic_opt -o %output
// EXEC: export LD_LIBRARY_PATH=$(pwd):$LD_LIBRARY_PATH && %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan get from CJ record: x -> 1 , y -> 2 , z -> 3
// ASSERT: scan change CJ record: x -> 5 , y -> 6 , z -> 7
// ASSERT: scan a is x -> 1, y -> 2, z -> 3
// ASSERT: scan s is x -> 5, y -> 6, z -> 7


from ffi import c.*

foreign func PassStructToC(s : MyStruct) : MyStruct

@c  // modified by @c.
record MyStruct {
   var x: Int64
   var y: Int64
   var z: Int64
   init (x_: Int64, y_: Int64, z_: Int64) {
      x = x_
      y = y_
      z = z_
   }
}

unsafe func main() {
    var s = MyStruct(1, 2, 3)
    var a = PassStructToC(s)
    print("s is x -> ${a.x}, y -> ${a.y}, z -> ${a.z}")
    print("a is x -> ${s.x}, y -> ${s.y}, z -> ${s.z}")
    0
}
