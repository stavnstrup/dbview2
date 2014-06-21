'use strict';
var myApp = angular.module('myApp', ['ngRoute']);

myApp.config(['$routeProvider', '$locationProvider', function ($routeProvider, $locationProvider) {
    $routeProvider
        .when ('/', {
            templateUrl: 'partials/home.html'
        })
        .when ('/standards', {
            templateUrl: 'partials/all-standards.html',
	    controller: 'StandardsController'
        })
        .when ('/profiles', {
            templateUrl: 'partials/all-profiles.html',
 	    controller: 'ProfilesController'
        })
        .when ('/standards/mandatory', {
            templateUrl: 'partials/selected.html',
	    controller: 'MandatoryController'
        })
        .when ('/standards/emerging', {
            templateUrl: 'partials/selected.html',
	    controller: 'EmergingController'
        })
        .when ('/standards/fading', {
            templateUrl: 'partials/selected.html',
 	    controller: 'FadingController'
        })
        .when ('/standard/:stdid', {
            templateUrl: 'partials/standard.html',
 	    controller: 'StandardController'
        })
        .when ('/revisions', {
            templateUrl: 'partials/history.html',
	    controller: 'RevController'
        });
    // Use the HTML5 History API
    $locationProvider.html5Mode(false);
}]);



myApp.controller('StandardsController', ['$scope', '$http', function ($scope, $http) {
    $scope.nispdb = {};

    $http.get('/data/standards-all.json')
      .success(function (data) {
          $scope.nispdb = angular.fromJson(data).standards;
      });
}]);

myApp.controller('StandardController', ['$scope', '$http', '$routeParams', function ($scope, $http, $routeParams) {
    $scope.standard = {};
    $scope.stdid = $routeParams.stdid;

    $http.get('/data/standards/' + $scope.stdid + '.json')
//    $http.get('/data/standards/ietf-rfc1812.json')
      .success(function (data) {
          $scope.standard = angular.fromJson(data).standard;
      });
}]);


myApp.controller('ProfilesController', ['$scope', '$http', function ($scope, $http) {
    $scope.nispdb = {};

    $http.get('/data/profiles-all.json')
      .success(function (data) {
          $scope.nispdb = angular.fromJson(data).standards;
      });
}]);


myApp.controller('MandatoryController', ['$scope', '$http', function ($scope, $http) {
    $scope.nispdb = {};

    $http.get('/data/standards-mandatory.json')
      .success(function (data) {
          $scope.nispdb = angular.fromJson(data).nispdb;
      });
}]);


myApp.controller('EmergingController', ['$scope', '$http', function ($scope, $http) {
    $scope.nispdb = {};

    $http.get('/data/standards-emerging.json')
      .success(function (data) {
          $scope.nispdb = angular.fromJson(data).nispdb;
      });
}]);

myApp.controller('FadingController', ['$scope', '$http', function ($scope, $http) {
    $scope.nispdb = {};

    $http.get('/data/standards-fading.json')
      .success(function (data) {
          $scope.nispdb = angular.fromJson(data).nispdb;
      });
}]);


myApp.controller('RevController', ['$scope', '$http', function ($scope, $http) {
    $scope.nispdb = {};

    $http.get('/data/history.json')
      .success(function (data) {
          $scope.nispdb = angular.fromJson(data).standards;
      });
}]);


