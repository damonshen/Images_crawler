chrome.extension.sendMessage {}, (response)->
  readyStateCheckInterval = setInterval ->
    if document.readyState is "complete"
      clearInterval(readyStateCheckInterval);
      console.log "Hello. This message was sent from scripts/inject.js"
  , 10

#add listener for connect the port to extension
chrome.runtime.onMessage.addListener (request, sender, sendResponse)->
  if request.hello is \hi
    sendResponse {response: \from_content_script}
    console.log \received
