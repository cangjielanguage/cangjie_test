package pkg1

open  class Base {
    open func get() : Int32 {
        return  1
    }
}

internal  class Data <: Base {
    override func get() : Int32 {
        return  2
    }
}
