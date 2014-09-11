chrome.extension.sendMessage {}, (response)->
  readyStateCheckInterval = setInterval ->
    if document.readyState is "complete"
      clearInterval(readyStateCheckInterval);
      console.log "Hello. This message was sent from scripts/inject.js"
  , 10

#open a port for long-lived connections
chrome.runtime.onConnect.addListener (port)->
  console.log port.name is \imc_port
  port.onMessage.addListener (msg)->
    console.log msg
    if msg.hihi?
        console.log msg.hihi
        port.postMessage {res: 'response_from_long'}
    else if msg.res?
        console.log msg.res

#add listener for one time request
chrome.runtime.onMessage.addListener (request, sender, sendResponse)->
  if request.hello is \hi
    sendResponse {response: \from_content_script}
    console.log \received
