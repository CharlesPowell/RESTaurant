var app = app || {};

app.PartyCollection = Backbone.Collection.extend({
  model: app.PartyModel,
  url: '/api/parties'
})
