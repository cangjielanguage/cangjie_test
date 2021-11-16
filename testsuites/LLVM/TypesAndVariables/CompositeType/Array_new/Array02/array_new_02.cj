// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

let a = Array<Int8>()
let a1 = Array<Int16>()
let a2 = Array<Int32>()
let a3 = Array<Int64>()
let a4 = Array<UInt8>()
let a5 = Array<UInt16>()
let a6 = Array<UInt32>()
let a7 = Array<UInt64>()

let a8 = Array<Float16>()
let a9 = Array<Float32>()
let a10 = Array<Float64>()

let a11 = Array<Char>()
let a12 = Array<Bool>()
let a13 = Array<String>()

func main(): Int64 {
    return a.size() + a1.size() + a2.size() + a3.size() + a4.size() + a5.size() + a6.size() + a7.size() + a8.size() + a9.size() + a10.size() + a11.size() + a12.size() + a13.size()
}
