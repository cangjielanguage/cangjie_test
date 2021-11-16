package operator_overloading_00701
class A {}
extend A <: update{
    operator func !():Bool {true}
}