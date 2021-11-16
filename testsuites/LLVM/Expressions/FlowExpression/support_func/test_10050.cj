package test

external class A<T>{
    static operator func ()(input:T):T{input}
    static operator func ()(input:(T)->T):Unit{}
}