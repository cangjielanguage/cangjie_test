// EXEC: %compiler %cmp_opt %f -backend-options=" -lcangjie-json" -o %output
// EXEC: %run %run_opt %output %run_args

//Brief:限制T <: Serializable<T>，实例化为基础类型，Int64
from std import json.*
from std import serialization.*

func serialize<T>(obj: Array<T>) : String where T <: Serializable<T> {
    return obj.serialize().toJson().toString()
}

func main() {
    print(serialize(Array<String>()))
    print(serialize(Array<Int64>()))
    0
}