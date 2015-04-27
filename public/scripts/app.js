
var app = {};


app.PartyCollection = Backbone.Collection.extend({
  model: app.PartyModel,
  url: '/api/parties'
})

app.OrderCollection = Backbone.Collection.extend({
  model: app.OrderModel,
  url: '/api/orders'
})

app.FoodCollection = Backbone.Collection.extend({
  model: app.FoodModel,
  url: '/api/foods'
})

$(document).ready(function(){

  app.partyList = new app.PartyCollection();
  app.orderList = new app.OrderCollection();
  app.foodList = new app.FoodCollection();
  app.partyList.fetch();
  app.orderList.fetch();
  app.foodList.fetch();

})
