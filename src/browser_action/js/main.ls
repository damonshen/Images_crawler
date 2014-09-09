angular.module \ImageCrawlerApp, []
  .controller \PageController, ($scope)->

    chrome.tabs.query {active: true currentWindow: true} (tabs)->
      chrome.tabs.sendMessage tabs[0].id, {hello: 'hi'}, (response)->
        console.log tabs
        console.log response.response
    $scope.tab = 2
    $scope.selectImages = ->
      alert 'message sent'
