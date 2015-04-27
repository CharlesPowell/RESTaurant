var app = app || {};

$(document).ready(function(){

  app.partyList = new app.PartyCollection();
  app.foodList = new app.FoodCollection();
  app.partyList.fetch();
  app.foodList.fetch();

})
