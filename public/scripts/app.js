
var app = {};

app.PartyModel = Backbone.Model.extend({});
app.OrderModel = Backbone.Model.extend({});
app.FoodModel = Backbone.Model.extend({});

app.PartyCollection = Backbone.Collection.extend({
  model: PartyModel,
  url: '/api/parties'
})

app.OrderCollection = Backbone.Collection.extend({
  model: OrderModel,
  url: '/api/orders'
})

app.FoodCollection = Backbone.Collection.extend({
  model: FoodModel,
  url: '/api/foods'
})

$(document).ready(function(){

  app.partyList = new PartyCollection();
  app.orderList = new OrderCollection();
  app.foodList = new FoodCollection();
  app.partyList.fetch();
  app.orderList.fetch();
  app.foodList.fetch();

})
