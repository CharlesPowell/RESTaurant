var app = app || {};

app.PartyView = Backbone.View.extend({
  initialize: function(){
    this.listenTo(this.model,'change', this.render);
    this.listenTo(this.model,'delete', this.remove);
  },
  template: _.template("<h3><%=name %></h3>"),
  //value=<%= id%>
  tagName: "div",
  className: 'party',
  render: function(){
    this.$el.html( this.template( this.model.attributes ) )
    //this.renderPartyList();
    return this;
  },
});
