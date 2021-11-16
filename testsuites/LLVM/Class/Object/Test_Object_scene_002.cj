// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

abstract class abs1 {}

class def_class1 <: abs1 {
    func get():Int32 {
        return 1
    }
}

abstract class abs2 <: core.Object {
    open func get():Int32 {
        return 2
    }
}

class def_class2 <: abs2 {
    override func get():Int32 {
        return 2
    }
}

external class ext3 <: core.Object {
    func get():Int32 {
        return 3
    }
}

internal class int4 <: core.Object {
    func get():Int32 {
        return 4
    }
}

open class Base5 {
    open func get() : Int32 {
        return 5
    }
}

open class Base6 <: Object {
    open func get() : Int32 {
        return 6
    }
}


func main(): Int64 {

    var myArray: ArrayList<Object> = ArrayList<Object>(0)

    myArray.add(def_class1())
    myArray.add(def_class2())
    myArray.add(ext3())
    myArray.add(int4())
    myArray.add(Base5())
    myArray.add(Base6())

    if (myArray.isEmpty()) {
        return 1
    }

    if (myArray.size() != 6) {
        return 1
    }

    return 0

}