package operator_overloading_00708

record A{
    operator func *(b:A):Bool{return true}
}

class C{
    operator func *(b:C):Bool{return true}
}

interface D{
    operator func *(b:D):Bool{return true}
}

class B <: D{}

