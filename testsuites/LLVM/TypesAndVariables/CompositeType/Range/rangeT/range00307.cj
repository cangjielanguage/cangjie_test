// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

interface I{
  func foo(a1!: Range<Int8>, a2!: Range<UInt8>, a3!: Range<Int16>, a4!: Range<UInt16>, a5!: Range<Int32>, a6!: Range<UInt32>, a7!: Range<Int64>, a8!: Range<UInt64>){

  }
}

class Test <: I{
	
}

func main(): Int64 {
    return 0;
}
