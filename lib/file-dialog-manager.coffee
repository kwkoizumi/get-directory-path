module.exports =
    class FileDialogManager
        defaultPath = "/"
        remote = require "remote"
        dialog = remote.require "dialog"

        options = {
            defaultPath: defaultPath,
            properties: ['openDirectory', 'createDirectory']
        }

        show: ->
            filenames = dialog.showOpenDialog options

            if filenames?
                return filenames[0]
            return defaultPath
