var app = app || {};

$(document).ready(function(){

  app.partyList = new app.PartyCollection();
  app.foodList = new app.FoodCollection();


  app.foodListView = new app.ListView({
    modelView: app.FoodView,
    collection: app.foodList,
    el: $('#food-list')
  });

  app.partyPullDown = new app.PullDownView({
    modelView: app.PartyView,
    collection: app.partyList,
    el: $('#party-list')
  });




  app.partyList.fetch();
  app.foodList.fetch();

})
