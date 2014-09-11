angular.module \ImageCrawlerApp, []
  .controller \PageController, ($scope)->

    chrome.tabs.query {active: true currentWindow: true} (tabs)->
      chrome.tabs.sendMessage tabs[0].id, {hello: 'hi'}, (response)->
        console.log tabs
        console.log response.response

      #open a port for long-lived connection with content script
      port = chrome.tabs.connect tabs[0].id, {name: \imc_port}
      $scope.tab = 2
      $scope.selectImages = ->
        port.postMessage {hihi: 'long'}
        port.onMessage.addListener (msg)->
          alert msg.res
          port.postMessage {res: 'from_popup'}
