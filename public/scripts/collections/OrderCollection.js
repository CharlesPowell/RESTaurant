var app = app || {};

app.OrderCollection = Backbone.Collection.extend({
  model: app.OrderModel,
  url: '/api/orders'
})
