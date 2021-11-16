package a

@JavaScript
external foreign class Moment {
  func fromNow() : Bool
}

@JsMember["./momentMember"]
external foreign func moment1() : Moment