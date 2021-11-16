// DEPENDENCE: %n.c cfg.json
// EXEC: sed -i "s!cangjieCFFI_path!%cstring_cjo!g" cfg.json
// EXEC: %clang %clang_opt %n.c -o %cffi_output
// EXEC: %compiler %chirvic off %cmp_opt %ffic_opt -o %output
// EXEC: export LD_LIBRARY_PATH=$(pwd):$LD_LIBRARY_PATH && %run %run_opt %output %run_args | compare %f
// ASSERT: scan 1\n2\n3


@c
record Point3D {
var x: Int64
var y: Int64
var z: Int64
}

foreign func malloc1(size: UIntNative) : CPointer<Unit>
foreign func addPoint(p1: Point3D, p2: Point3D) : Point3D

func main(){
    
    let s: UIntNative = 24
    let p: CPointer<Unit> = unsafe { malloc1(s) }
    var p2: CPointer<Point3D> = unsafe { CPointer<Point3D>(p) }
    
    unsafe { p2.write(Point3D(x:1, y:2, z:3)) } // 通过指针向目的地址写入数据
    let p3 = unsafe { p2.read() } // 通过指针读取目的地址数据
    let p4 = unsafe { p2 + 1 } // 指针偏移操作
    print("${p3.x}\n${p3.y}\n${p3.z}")
  
}

