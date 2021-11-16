var isMoment=function(x, y, z) {
  var person = {
    firstName: x,
    lastName : y,
    id       : z,
    fullName : function() {
      return this.firstName + " " + this.lastName;
    }
  };
  return person.fullName();
}
module.exports =  {
    isMoment
}