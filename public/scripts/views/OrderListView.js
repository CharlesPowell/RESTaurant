var app = app || {};

app.OrderListView = Backbone.View.extend({
  initialize: function(options){
    this.modelView = options.modelView;
    this.listenTo(this.collection,'sync', this.render);
  },
  render: function(){
    console.log("render orders")
    var models = this.collection.models;
    for (var i = 0; i < models.length; i++) {
      var subView = new this.modelView({model: models[i]});
      subView.render();
      this.$el.append( subView.$el );
      subView.delegateEvents();

      var startTimer = models[i].get('created')
      var timeDisplay = this.renderTime(startTimer);
      this.$el.append( timeDisplay );
    }
    return this;
  },
  renderTime: function(startTimer){
    var timerDisplay = $('<p>');

    setInterval(function(){
      now = Math.floor(Date.now()/1000);
      var timeLeft = 300 + (startTimer - now);
      timerDisplay.text( timeLeft );

      if (timeLeft<0){
        timerDisplay.css({backgroundColor: 'red'});
      } else if (timeLeft<120){
        timerDisplay.css({backgroundColor: 'yellow',color: 'black'});
      } else {
        timerDisplay.css({backgroundColor: 'green', color: 'black'});
      }
    }, 1000)

    return timerDisplay;
  }
});
