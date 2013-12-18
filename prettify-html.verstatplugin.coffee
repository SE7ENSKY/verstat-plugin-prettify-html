html = require 'html'

module.exports = (next) ->
	@postprocessor 'prettify-html',
		extname: '.html'
		priority: 10000
		postprocess: (file, done) =>
			if file.process and file.processor isnt null
				file.processed = html.prettyPrint file.processed, indent_size: 2
			else
				file.source = html.prettyPrint file.source, indent_size: 2
			@modified file
			done()

	next()