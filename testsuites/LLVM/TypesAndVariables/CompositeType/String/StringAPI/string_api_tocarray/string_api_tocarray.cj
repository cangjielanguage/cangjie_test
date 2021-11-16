// DEPENDENCE: %n.c
// EXEC: %clang -c %n.c -o lib%n.o
// EXEC: %compiler %cmp_opt %f lib%n.o -o %output
// EXEC: %run %run_opt %output %run_args

record MyRecord {
  MyRecord(var a : Int64) {}
}

foreign func cTest(x:CPointer<UInt8>) : CPointer<UInt8>

unsafe func main():Int64 {
    var a = "abc"
    var b = a.toCArray()
    var ptr: CPointer<UInt8> = unsafe { cTest(b) }
    if ( (ptr.read(0) == 97) && (ptr.read(1) == 98) && (ptr.read(2) == 99) ){
        return 0
    }
    return 1
}

