class moduleTest {
    obj=new object()
    static fromNow(module8) { 
      var obj=new Object()
      obj.name="hhh"
      console.log(obj)
      if (module8.chr != 't' ) {
        obj.name="object_08"
        return obj
      }
      if(module8.num!=8||module8.Bo){
        obj.num=8
        return obj
      }
      return obj
    }
}

module.exports = function () {
    return moduleTest
}
