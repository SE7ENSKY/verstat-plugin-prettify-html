prettify = require('js-beautify').html
opts =
	indent_char: "\t"
	indent_size: 1

module.exports = (next) ->
	@postprocessor 'prettify-html',
		extname: '.html'
		priority: 10000
		postprocess: (file, done) =>
			if not file.hasOwnProperty("prettify-html") or (file.hasOwnProperty("prettify-html") and file["prettify-html"])
				if file.processor isnt null
					file.processed = prettify file.processed, opts
				else
					file.source = prettify file.source, opts
				@modified file
			done()

	next()