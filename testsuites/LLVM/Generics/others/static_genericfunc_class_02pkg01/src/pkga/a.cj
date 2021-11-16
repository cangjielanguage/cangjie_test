
package pkga

external class Coo<T> {
   static var a:Option<T> = Option<T>.None
   static func foo<V>(x: V):Option<T>{
       return a
   }
}
