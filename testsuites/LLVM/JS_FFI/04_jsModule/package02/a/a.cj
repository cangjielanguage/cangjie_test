package a

@JavaScript
external foreign class Moment {
  func fromNow() : Bool
}

@JsModule["./momentModule"]
external foreign func moment1() : Moment