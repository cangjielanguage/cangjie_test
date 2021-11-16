package class_generic_invoke_03

class Data<T> {
    let count: T

    init(x: T){
        count = x
    }
}