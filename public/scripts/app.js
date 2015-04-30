var app = app || {};

app.renderOrder = function(){

      temp = "/api/parties/" + $("#party-list").val()
      $.ajax({
        method: 'get',
        url: temp,
        success: function(data){
          $('#order-list').empty();
          for(var i = 0; i < data.orders.length; i++){

            food_id = data.orders[i].food_id
            obj = _.find(app.foodList.models, function(obj) { return obj.id == food_id });
            orderFoodView = new app.OrderFoodView({
              model: obj,
              el: $('#order-list')
            })
            orderFoodView.render();
            console.log(obj.id)
          }
        }
      })

}



$(document).ready(function(){


  app.partyList = new app.PartyCollection();
  app.foodList = new app.FoodCollection();
  app.orderList = new app.OrderCollection();


  app.foodListView = new app.ListView({
    modelView: app.MenuFoodView,
    collection: app.foodList,
    el: $('#food-list')
  });

  app.partyPullDown = new app.PullDownView({
    modelView: app.PartyView,
    collection: app.partyList,
    el: $('#party-list')
  });
  app.kitchenOrders = new app.OrderListView({
    modelView: app.OrderView,
    collection: app.orderList,
    el: $("#kitchen-orders")

  })


  app.partyList.fetch();
  app.foodList.fetch();
  app.orderList.fetch();

  $("#party-list").change(function(){
    app.renderOrder();
  })

  $("#check-out").click(function(){
      party_id = parseInt($('#party-list').val());

      checkUrl = "/api/parties/"+ String(party_id) + "/receipt";
      console.log(party_id);
      $.ajax({
        url: checkUrl,
        method: 'get',
        success: function(){
          console.log("Success!");
        }
      })
    });

  $("#place-order").click(function(){

    party_id = parseInt($('#party-list').val());
    food_id = app.foodSelection.attributes.id;
    appData = {order: {party_id: party_id, food_id: food_id}};
    $.ajax({
      url: "/api/orders",
      method: 'post',
      data: appData,
      success: function(){
        console.log("Success!");
        app.renderOrder();
        $(".food-selected").removeClass('food-selected');
        $(".party-selected").removeClass('party-selected');
      }
    })

  });

})
