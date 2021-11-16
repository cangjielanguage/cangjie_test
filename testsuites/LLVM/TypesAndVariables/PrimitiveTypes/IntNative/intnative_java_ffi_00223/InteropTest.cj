package test

import java.lang.*

@java
external interface Serializable {}

@java
external class InteropTest <: Serializable {
    public var firstName: IntNative = 0
    public var lastName: IntNative = 0
    public var description: Int32 = 0

    public static func serialize(interopTest: InteropTest):Unit {}
    public static func deserialize(): InteropTest { return InteropTest() }
}
