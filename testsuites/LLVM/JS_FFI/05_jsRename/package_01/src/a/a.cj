package a

@JsObject
external class Complex {
    Complex(
        let bo!: Bool,
        let str!: String,
        let num!: Int64,
        let fun!: (Int64) -> Int64
    ) {}
}