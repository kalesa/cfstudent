var app = angular.module('shop', ['ngResource']);//we are going to use dependency injection to add the module to our app

$(document).on('ready page:load', function() {
  angular.bootstrap(document.body, ['shop'])
});

//Now we can use $resource to access our RESTful data.
app.factory('models', ['$resource', function($resource){
  var orders_model = $resource("/orders/:id.json", {id: "@id"});
  var products_model = $resource("/products/:id.json", {id: "@id"});

  var x = {
    orders: orders_model,
    products: products_model
  };
  return x;
}]);

app.controller('OrdersCtrl', ['$scope', 'models', function($scope, models){
  // Here will be all code belonging to this controller
  $scope.orders = models.orders.query();
  $scope.products = models.products.query();
   //$scope.orders =[
    //{id: 1, total: 24, product_id: 1, user_id: 1},
    //{id: 2, total: 7, product_id: 1},
    //{id: 3, total: 42, product_id: 1, user_id: 1}
  //];
  $scope.addOrder = function(){
    //To make sure an order can only be submitted if both product_id and total are filled out
    if(!$scope.newOrder.product_id || $scope.newOrder.total === ''){ return; }
    order = models.orders.save($scope.newOrder, function(){
      recent_order = models.orders.get({id: order.id});
      $scope.orders.push(recent_order);
      $scope.newOrder = '';//the data of $scope.newOrder will be saved through a POST request in our database (which we access through models.orders)
    });
  };
  $scope.deleteOrder = function(order){
    models.orders.delete(order);
    $scope.orders.splice($scope.orders.indexOf(order), 1);//indexOf will get the index number of a certain object
}
}]);

