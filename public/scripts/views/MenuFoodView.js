var app = app || {};

app.MenuFoodView = Backbone.View.extend({
  initialize: function(){
    this.listenTo(this.model,'change', this.render);
    this.listenTo(this.model,'delete', this.remove);
  },
  template: _.template('<%= name %>   <p><%= price %><button class="select-food">Select</button></p>'),
  tagName: 'li',
  className: 'food',
  render: function(){
    this.$el.append( this.template( this.model.attributes ) );
    return this;
  },
  events:{
    'click .select-food': 'selectFood'
  },
  selectFood: function(){
    $('.food-selected').removeClass('food-selected');
    this.$el.addClass('food-selected');
    app.foodSelection = this.model;
  }
});
