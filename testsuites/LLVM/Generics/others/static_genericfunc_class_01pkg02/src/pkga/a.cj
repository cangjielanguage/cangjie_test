
package pkga

external class Coo<T> {
    static func foo<V>(x: V): V{
        return x
    }
}

external var i: Int32 = 3
external var res: Int32 = Coo<String>.foo<Int32>(i)