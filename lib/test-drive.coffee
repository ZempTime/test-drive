TestDriveView = require './test-drive-view'
{CompositeDisposable} = require 'atom'

module.exports = TestDrive =
  testDriveView: null
  modalPanel: null
  subscriptions: null

  activate: (state) ->
    @testDriveView = new TestDriveView(state.testDriveViewState)
    @modalPanel = atom.workspace.addModalPanel(item: @testDriveView.getElement(), visible: false)

    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    # Register command that toggles this view
    @subscriptions.add atom.commands.add 'atom-workspace', 'test-drive:toggle': => @toggle()
    @sound = new Audio('atom://test-drive/styles/omnom.mp3')

  deactivate: ->
    @modalPanel.destroy()
    @subscriptions.dispose()
    @testDriveView.destroy()

  serialize: ->
    testDriveViewState: @testDriveView.serialize()

  toggle: ->
    console.log 'TestDrive was toggled!'

    if @modalPanel.isVisible()
      @modalPanel.hide()
    else
      editor = atom.workspace.getActiveTextEditor()
      words = editor.getText().split(/\s+/).length
      @testDriveView.setCount(words)
      @sound.play()
      @modalPanel.show()
