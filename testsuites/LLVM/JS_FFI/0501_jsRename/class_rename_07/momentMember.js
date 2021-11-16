let cangjiejs = require('./cangjie');

class A{
  static getB(){
    return new cangjiejs.Int64(1)
  }
}

module.exports =  {
    A.getB
}