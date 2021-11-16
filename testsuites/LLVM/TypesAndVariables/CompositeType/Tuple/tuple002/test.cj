// EXEC:%compiler %cmp_opt %f -o %output
// EXEC:%run %run_opt %output %run_args

func main(): Int64 {
    var a : Int8 = 1
    var b : Int16 = 1
    var c : Int32 = 1
    var d : Int64 = 1
    var e : UInt8 = 1
    var f : UInt16 = 1
    var g : UInt32 = 1
    var h : UInt64 = 1
    var i : Float32 = 1.0
    var j : Float64 = 1.0
    var MyTuple = ((a,b),(c,(d,(e,(f,g),h),i),j))
    return 0
}
