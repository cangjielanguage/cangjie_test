
// EXEC-PIPE: %compiler %stdx_cmp_opt %f -backend-options="-L $CANGJIE_HOME/lib -lcangjie-json" -o %output
// EXEC-PIPE: %stdx_run %stdx_run_opt %output %stdx_run_args

from std import serialization.*
from std import math.*
from std import json.*

class A <: Serializable<A> {

    var fieldTemp1 : Int8
    var fieldTemp2 : UInt8
    var fieldTemp3 : Int16
    var fieldTemp4 : UInt16
    var fieldTemp5 : Int32
    var fieldTemp6 : UInt32
    var fieldTemp7 : Int64
    var fieldTemp8 : UInt64
    var fieldTemp9 : B

    init(fieldTemp1 : Int8, fieldTemp2 : UInt8, fieldTemp3 : Int16, fieldTemp4 : UInt16, fieldTemp5 : Int32,
        fieldTemp6 : UInt32, fieldTemp7 : Int64, fieldTemp8 : UInt64, fieldB1 : Float16, fieldB2 : Float32,
        fieldB3 : Float64, FieldB4 : Char, fieldB5 : Bool, FieldB6 : String) {
        this.fieldTemp8 = fieldTemp8
        this.fieldTemp2 = fieldTemp2
        this.fieldTemp1 = fieldTemp1
        this.fieldTemp3 = fieldTemp3
        this.fieldTemp6 = fieldTemp6
        this.fieldTemp5 = fieldTemp5
        this.fieldTemp4 = fieldTemp4
        this.fieldTemp7 = fieldTemp7
        this.fieldTemp9 = B(fieldB1, fieldB2, fieldB3, FieldB4, fieldB5, FieldB6)
        print("this.fieldTemp1 is ${this.fieldTemp1}")
        print("this.fieldTemp2 is ${this.fieldTemp2}")
        print("this.fieldTemp3 is ${this.fieldTemp3}")
        print("this.fieldTemp4 is ${this.fieldTemp4}")
    }

    func serialize(): DataModel {
        let dms = DataModelStruct()
        dms.add(Field("fieldTemp1", fieldTemp1.serialize()))
        dms.add(Field("fieldTemp2", fieldTemp2.serialize()))
        dms.add(Field("fieldTemp3", fieldTemp3.serialize()))
        dms.add(Field("fieldTemp4", fieldTemp4.serialize()))
        dms.add(Field("fieldTemp5", fieldTemp5.serialize()))
        dms.add(Field("fieldTemp6", fieldTemp6.serialize()))
        dms.add(Field("fieldTemp7", fieldTemp7.serialize()))
        dms.add(Field("fieldTemp8", fieldTemp8.serialize()))
        dms.add(Field("fieldTemp9", fieldTemp9.serialize()))
        return dms
    }

    static func deserialize(dm: DataModel): A {
        let dms = (dm as DataModelStruct).getOrThrow()
        A(dms)
    }

    private init(dms : DataModelStruct) {
          this.fieldTemp1 = Int8.deserialize(dms.get("fieldTemp1"))
          this.fieldTemp2 = UInt8.deserialize(dms.get("fieldTemp2"))
          this.fieldTemp3 = Int16.deserialize(dms.get("fieldTemp3"))
          this.fieldTemp4 = UInt16.deserialize(dms.get("fieldTemp4"))
          this.fieldTemp5 = Int32.deserialize(dms.get("fieldTemp5"))
          this.fieldTemp6 = UInt32.deserialize(dms.get("fieldTemp6"))
          this.fieldTemp7 = Int64.deserialize(dms.get("fieldTemp7"))
          this.fieldTemp8 = UInt64.deserialize(dms.get("fieldTemp8"))
          this.fieldTemp9 = B.deserialize(dms.get("fieldTemp9"))
    }

    operator func ==(rhs : A) : Bool {
        var result = true
        if (!(this.fieldTemp1 == rhs.fieldTemp1)) {
            print("fieldTemp1 is not equal, the origin is ${this.fieldTemp1}, the value convert from string is ${rhs.fieldTemp1} \n")
            result = false
        }
        if (!(this.fieldTemp2 == rhs.fieldTemp2)) {
            print("fieldTemp2 is not equal, the origin is ${this.fieldTemp2}, the value convert from string is ${rhs.fieldTemp2} \n")
            result = false
        }
        if (!(this.fieldTemp3 == rhs.fieldTemp3)) {
            print("fieldTemp3 is not equal, the origin is ${this.fieldTemp3}, the value convert from string is ${rhs.fieldTemp3} \n")
            result = false
        }
        if (!(this.fieldTemp4 == rhs.fieldTemp4)) {
            print("fieldTemp4 is not equal, the origin is ${this.fieldTemp4}, the value convert from string is ${rhs.fieldTemp4} \n")
            result = false
        }
        if (!(this.fieldTemp5 == rhs.fieldTemp5)) {
            print("fieldTemp5 is not equal, the origin is ${this.fieldTemp5}, the value convert from string is ${rhs.fieldTemp5} \n")
            result = false
        }
        if (!(this.fieldTemp6 == rhs.fieldTemp6)) {
            print("fieldTemp6 is not equal, the origin is ${this.fieldTemp6}, the value convert from string is ${rhs.fieldTemp6} \n")
            result = false
        }
        if (!(this.fieldTemp7 == rhs.fieldTemp7)) {
            print("fieldTemp7 is not equal, the origin is ${this.fieldTemp7}, the value convert from string is ${rhs.fieldTemp7} \n")
            result = false
        }
        if (!(this.fieldTemp8 == rhs.fieldTemp8)) {
            print("fieldTemp8 is not equal, the origin is ${this.fieldTemp8}, the value convert from string is ${rhs.fieldTemp8} \n")
            result = false
        }
        if (!(this.fieldTemp9 == rhs.fieldTemp9)) {
            print("fieldTemp9 is not equal\n")
            result = false
        }
        return result
    }

}

class B <: Serializable<B> {
    var fieldTemp1 : Float16 = 0.0
    var fieldTemp2 : Float32 = -2.0
    var fieldTemp3 : Float64 = 433_4155.0
    var fieldTemp4 : Char = '\n'
    var fieldTemp5 : Bool = true
    var fieldTemp6 : String = "hello world ${fieldTemp4}}"

    init(fieldTemp1 : Float16, fieldTemp2 : Float32, fieldTemp3 : Float64, fieldTemp4 : Char, fieldTemp5 : Bool, fieldTemp6 : String) {
        this.fieldTemp1 = fieldTemp1
        this.fieldTemp2 = fieldTemp2
        this.fieldTemp3 = fieldTemp3
        this.fieldTemp4 = fieldTemp4
        this.fieldTemp5 = fieldTemp5
        this.fieldTemp6 = fieldTemp6
    }

    func serialize(): DataModel {
        let dms = DataModelStruct()
        dms.add(Field("fieldTemp1", fieldTemp1.serialize()))
        dms.add(Field("fieldTemp2", fieldTemp2.serialize()))
        dms.add(Field("fieldTemp3", fieldTemp3.serialize()))
        dms.add(Field("fieldTemp4", fieldTemp4.serialize()))
        dms.add(Field("fieldTemp5", fieldTemp5.serialize()))
        dms.add(Field("fieldTemp6", fieldTemp6.serialize()))
        return dms
    }

    static func deserialize(dm: DataModel): B {
        let dms = (dm as DataModelStruct).getOrThrow()
        B(dms)
    }

    private init(dms : DataModelStruct) {
          this.fieldTemp1 = Float16.deserialize(dms.get("fieldTemp1"))
          this.fieldTemp2 = Float32.deserialize(dms.get("fieldTemp2"))
          this.fieldTemp3 = Float64.deserialize(dms.get("fieldTemp3"))
          this.fieldTemp4 = Char.deserialize(dms.get("fieldTemp4"))
          this.fieldTemp5 = Bool.deserialize(dms.get("fieldTemp5"))
          this.fieldTemp6 = String.deserialize(dms.get("fieldTemp6"))
    }

    operator func ==(rhs : B) : Bool {
        var result = true
        if (!(this.fieldTemp1 == rhs.fieldTemp1)) {
            print("fieldTemp1 is not equal, the origin is ${this.fieldTemp1}, the value convert from string is ${rhs.fieldTemp1} \n")
            result = false
        }
        if (!(this.fieldTemp2 == rhs.fieldTemp2)) {
            print("fieldTemp2 is not equal, the origin is ${this.fieldTemp2}, the value convert from string is ${rhs.fieldTemp2} \n")
            result = false
        }
        if (!(this.fieldTemp3 == rhs.fieldTemp3)) {
            print("fieldTemp3 is not equal, the origin is ${this.fieldTemp3}, the value convert from string is ${rhs.fieldTemp3} \n")
            result = false
        }
        if (!(this.fieldTemp4 == rhs.fieldTemp4)) {
            print("fieldTemp4 is not equal, the origin is ${this.fieldTemp4}, the value convert from string is ${rhs.fieldTemp4} \n")
            result = false
        }
        if (!(this.fieldTemp5 == rhs.fieldTemp5)) {
            print("fieldTemp5 is not equal, the origin is ${this.fieldTemp5}, the value convert from string is ${rhs.fieldTemp5} \n")
            result = false
        }
        if (!(this.fieldTemp6 == rhs.fieldTemp6)) {
            print("fieldTemp6 is not equal, the origin is ${this.fieldTemp6}, the value convert from string is ${rhs.fieldTemp6} \n")
            result = false
        }
        return result
    }

}

class TestSerialization {

    func run() {
        let temp = "\\\\\\"
        let instances : List<A> = [A(-10, 10, -20, 20, -30, 30, -40, 40, -50.0, 60.0, 70.0, '`', true, #"\\"#)]
//        [A(MinInt8, 0, MinInt16, 0, MinInt32, 0, MinInt64, 0, MinFloat16, MinFloat32, MinFloat64, '`', true, #"\\"#),
//        A(MaxInt8, MaxUInt8, MaxInt16, MaxUInt16, MaxInt32, MaxUInt32, MaxInt64, MaxUInt64, MaxFloat16, MaxFloat32, MaxFloat64, '\'', true, "${temp}" ),
//        A(1, 2, 3, 4, 5, 6, 7, 8, NaN16, NaN32, NaN64, '\\', false, """
//        """),
//        A(1, 2, 3, 4, 5, 6, 7, 8, Inf16(0), Inf32(0), Inf64(0), 'a', true, #""#),
//        A(1, 2, 3, 4, 5, 6, 7, 8, Inf16(-1), Inf32(-1), Inf64(-1), 'a', true, "hello"),
//        A(1, 2, 3, 4, 5, 6, 7, 8, PI16, PI32, PI64, 'a', true, "hello"),
//        A(1, 2, 3, 4, 5, 6, 7, 8, E16, E32, E64, 'a', true, "hello"),
//        A(1, 2, 3, 4, 5, 6, 7, 8, MinDenormalFloat16, E32, Pi, 'a', true, "hello"),
//        A(1, 2, 3, 4, 5, 6, 7, 8, MinNormalFloat16, E32, E, 'a', true, "hello")]
        var caseID = 1
        var result : Int64 = 0
        for (orign in instances) {
            if (testSerialize(orign) == 1) {
                print("case ${caseID} is failed\n")
                result = 1
            }
        }
        return result
    }

    func testSerialize(origin : A) : Int64 {
        // 需要覆盖各数据类型的极限值，浮点类型需覆盖NAN和INF，字符串类型需覆盖转义
        let dataModel : DataModel = origin.serialize()
        let jsonValue : JsonValue = dataModel.toJson()
        let stringOriginValue : String = jsonValue.toString()
        print(stringOriginValue + "\n")

        // 暂不考虑安全、可靠等特性
        // 覆盖缩进、特殊的浮点数据以及转义字符串等
        let parseValue : JsonValue = JsonValue.fromStr(stringOriginValue)
        let dataModelValue : DataModel = DataModel.fromJson(jsonValue)
        let originValue : A = A.deserialize(dataModelValue)

        if (origin == originValue) {
            return 0
        }
        return 1
    }
}

func main() : Int64 {
    return TestSerialization().run()
}
