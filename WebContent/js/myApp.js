var products_uri = "http://localhost:5555/api/products";
var pageSize = 5;
var app = angular.module("myApp", []);
app.controller("myCtrl", function ($scope, $http) {
    //get all classes
    $http({
        method: 'GET',
        url: products_uri
    }).then(function (response) {
        $scope.StatusCodeClasses = response.status;
        $scope.StatusText = response.statustext;
        $scope.Products = response.data;
    }, function (response) {
        //Second function handles error
        $scope.Content = true;
    });
});