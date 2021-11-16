package a

@JavaScript
external foreign class Moment {
  func fromNow() : Bool
}

@JsMember["./momentMember"]
@JsRename["moment1"]
external foreign func package02() : Moment