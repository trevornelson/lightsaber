function(){
  return {
    add: function(a,b){
      return a+b;
    },
    sub: function(a,b){
      return a-b;
    },
    mul: function(a,b){
      return a*b;
    },
    div: function(a,b){
      if(b != 0){
        return a/b;
      }else if{
        return "Can not divide by zero.";
      }
    }
  };
}
