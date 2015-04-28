var app = app || {};

app.PartyView = Backbone.View.extend({
  initialize: function(){
    this.listenTo(this.model,'change', this.render);
    this.listenTo(this.model,'delete', this.remove);
  },
  //value=<%= id%>
  tagName: "option",
  className: 'party',
  //attributes: {value: this.model.id},
  render: function(){
    this.$el.prop("value", this.model.attributes.id);
    this.$el.html(this.model.attributes.name);
    //this.$el.html( this.template( this.model.attributes ) )
    //this.renderPartyList();
    return this;
  },
});
