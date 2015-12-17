module.exports =
class TestDriveView
  constructor: (serializedState) ->
    # Create root element
    @element = document.createElement('div')
    @element.classList.add('shark-right')

    # Create message element
    message = document.createElement('div')
    img = document.createElement('img')
    img.src = "atom://test-drive/styles/shark.png"
    message.textContent = "The TestDrive package is Alive! It's ALIVE!"
    message.classList.add('message')
    @element.appendChild(message)
    @element.appendChild(img)

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @element.remove()

  getElement: ->
    @element

  setCount: (count) ->
    displayText = "There are #{count} words."
    @element.children[0].textContent = displayText
