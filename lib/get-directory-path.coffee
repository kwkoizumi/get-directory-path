FileDialogManager = require "./file-dialog-manager"
{CompositeDisposable} = require 'atom'

module.exports =

    activate: (state) ->
        # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
        @subscriptions = new CompositeDisposable
        @manager = new FileDialogManager

        # Register command that toggles this view
        @subscriptions.add atom.commands.add 'atom-workspace', 'get-directory-path:get': => @get()

    get: ->
        editor = atom.workspace.getActivePaneItem()
        name = @manager?.show()
        editor.insertText name
