// EXEC: %compiler %stdx_cmp_opt  %f -o %output
// EXEC: %stdx_run %stdx_run_opt %output %stdx_run_args | compare %f
// ASSERT: scan success

from std import util.*
func main()
{
    var r=Random(UInt64(65))
    r.setSeed(UInt64(8))
    var m1=(r.nextBool() is Bool)
    var m2=(r.nextUInt8() is UInt8)
    var m3=(r.nextUInt16()is UInt16)
    var m4=(r.nextUInt32() is UInt32)
    var m5=(r.nextUInt64() is UInt64)
    var m6=(r.nextInt8() is Int8)
    var m7=(r.nextInt16() is Int16)
    var m8=(r.nextInt32() is Int32)
    var m9=(r.nextInt64() is Int64)
    var m10=(r.nextFloat16() is Float16)
    var m11=(r.nextFloat32() is Float32)
    var m12=(r.nextFloat64() is Float64)
    var m13=(r.nextGaussianFloat16() is Float16)
    var m14=(r.nextGaussianFloat32() is Float32)
    var m15=(r.nextGaussianFloat64() is Float64)
    if( m1 == false)
    {
       return 1
    }
    if( m2 == false)
    {
       return 2
    }
    if( m3 == false)
    {
       return 3
    }
    if( m4 == false)
    {
       return 4
    }
    if( m5 == false)
    {
       return 5
    }
    if( m6 == false)
    {
       return 6
    }
    if( m7 == false)
    {
       return 7
    }
    if( m8 == false)
    {
       return 8
    }
    if( m9 == false)
    {
       return 9
    }
    if( m10 == false)
    {
       return 10
    }
    if( m11 == false)
    {
       return 11
    }
    if( m12 == false)
    {
       return 12
    }
    if( m13 == false)
    {
       return 13
    }
    if( m14 == false)
    {
       return 14
    }
    if( m15 == false)
    {
       return 15
    }
    print("success\n")
    return 0
}