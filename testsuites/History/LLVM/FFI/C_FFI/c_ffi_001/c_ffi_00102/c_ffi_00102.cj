// DEPENDENCE: %n.c
// EXEC: %clang -c %n.c -o lib%n.o
// EXEC: %compiler %cmp_opt %f lib%n.o -o %output
// EXEC: %run %run_opt %output %run_args

@c
record BiggerStruct {
    BiggerStruct(var a : Int8,    // Char
                var b : Int8,    // signed Char
                var c : UInt8,   // unsigned Char
                var d : Int16,   // short
                var e : UInt16,  // unsigned short
                var f : Int32,   // int
                var g : Int32,   // signed int
                var h : UInt32,  // unsigned int
                var i : Int64,   // long long
                var j : UInt64,  // unsigned long long
                var k : Float32, // float
                var l : Float64, // double
                var m : Bool,    // Bool
                var o : Char) {}  // unsigned int
}

foreign func PassToCBigger(x:BiggerStruct): BiggerStruct

func PassAndReturnCStructByValueBigger():Int64
{
  var biggerPass = BiggerStruct(1,1,1,1,1,1,1,1,1,1,1.0,1.0,false,'a')
  var biggerReturn = unsafe { PassToCBigger(biggerPass) }

  if (biggerReturn.a != Int8(2)) {
    return 1
  }
  if (biggerReturn.b != Int8(2)) {
    return 2
  }
  if (biggerReturn.c != UInt8(2)) {
    return 3
  }
  if (biggerReturn.d != Int16(2)) {
    return 4
  }
  if (biggerReturn.e != UInt16(2)) {
    return 5
  }
  if (biggerReturn.f != Int32(2)) {
    return 6
  }
  if (biggerReturn.g != Int32(2)) {
    return 7
  }
  if (biggerReturn.h != UInt32(2)) {
    return 8
  }
  if (biggerReturn.i != Int64(2)) {
    return 9
  }
  if (biggerReturn.j != UInt64(2)) {
    return 10
  }
  if (biggerReturn.k != Float32(2)) {
    return 11
  }
  if (biggerReturn.l != Float64(2)) {
    return 12
  }
  if (biggerReturn.m != true) {
    return 13
  }
  if (biggerReturn.o != 'b') {
    return 14
  }
  return 0
}

func main():Int64 {
  return PassAndReturnCStructByValueBigger()
}
