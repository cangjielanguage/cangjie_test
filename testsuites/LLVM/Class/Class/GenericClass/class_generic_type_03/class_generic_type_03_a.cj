package class_generic_type_03

internal class Data<T> {
    let count: T

    init(x: T){
        count = x
    }
}