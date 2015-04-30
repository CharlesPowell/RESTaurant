var app = app || {};

app.OrderView = Backbone.View.extend({
  initialize: function(){
    this.listenTo(this.model,'change', this.render);
    this.listenTo(this.model,'delete', this.remove);
  },
  //__Time Left = <%= timeLeft%>
  //__Created = <%= created%>
  template: _.template('Food:<%= food_id %>__Party:<%= party_id %>'),
  tagName: 'li',
  className: 'order',
  render: function(){

    this.$el.append( this.template( this.model.attributes ) );
    return this;
  }
});
