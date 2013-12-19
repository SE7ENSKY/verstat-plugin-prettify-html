prettify = require('js-beautify').html
opts =
	indent_char: "\t"
	indent_size: 1

module.exports = (next) ->
	@postprocessor 'prettify-html',
		extname: '.html'
		priority: 10000
		postprocess: (file, done) =>
			if file.process and file.processor isnt null
				file.processed = prettify file.processed, opts
			else
				file.source = prettify file.source, opts
			@modified file
			done()

	next()