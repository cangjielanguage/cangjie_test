// EXEC: %compiler %cmp_opt  %f  -o %output
// EXEC: %run %run_opt %output %run_args

var map01:Map<Int8,Int8> = #{1:2}
var map02:Map<Int16,Int16> = #{1:2}
var map03:Map<Int32,Int32> = #{1:2}
var map04:Map<Int64,Int64> = #{1:2}
var map05:Map<UInt8,UInt8> = #{1:2}
var map06:Map<UInt16,UInt16> = #{1:2}
var map07:Map<UInt32,UInt32> = #{1:2}
var map08:Map<UInt64,UInt64> = #{1:2}
var map09:Map<Float16,Float16> = #{3.14:3.14}
var map10:Map<Float32,Float32> = #{3.14:3.14}
var map11:Map<Float64,Float64> = #{3.14:3.14}
var value1 = map01.getOrDefault(1, 10)
var value2 = map02.getOrDefault(1, 10)
var value3 = map03.getOrDefault(1, 10)
var value4 = map04.getOrDefault(1, 10)
var value5 = map05.getOrDefault(1, 10)
var value6 = map06.getOrDefault(1, 10)
var value7 = map07.getOrDefault(1, 10)
var value8 = map08.getOrDefault(1, 10)
var value9 = map09.getOrDefault(3.14, 10.0)
var value10 = map10.getOrDefault(3.14, 10.0)
var value11 = map11.getOrDefault(3.14, 10.0)

func main(): Int64 {
    if ( value1 == 2 && value2 == 2 && value3 == 2 && value4 == 2 && value5 == 2 && value6 == 2 && value7 == 2 && value8 == 2 && value9 == 3.14 && value10 == 3.14 && value11 == 3.14){
        return 0
    }
    return 1
}


