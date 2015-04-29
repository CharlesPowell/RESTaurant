var app = app || {};

app.OrderFoodView = Backbone.View.extend({
  initialize: function(){
    this.listenTo(this.model,'change', this.render);
    this.listenTo(this.model,'delete', this.remove);
  },
  template: _.template('<%= name %>   <p><%= price %>'),
  tagName: 'li',
  className: 'food',
  render: function(){
    this.$el.append( this.template( this.model.attributes ) );
    return this;
  }
});
