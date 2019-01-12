style: """
	color: white
	left: 0px
	top: 10px
	font-size: 10px
	font-family: SFNS Display, 'Andale Mono', sans-serif
	text-shadow: 1px 1px 0 rgba(#000, 0.2)
	background-color: rgba(0, 0, 0, 0.1)
	padding: 12px
	border-radius: 6px
	border: 0px solid #222

	table
		margin: 0 auto
		td
			padding: 4px

	.ip
		opacity: 0.6
		font-size: 13px

	.url
		padding: 0 10px

	.online
		padding: 0 10px
		color: rgb(153, 227, 160)

	.offline
		padding: 0 10px
		color: rgb(244, 115, 94)

"""

command: "check-urls.widget/loop_list.sh check-urls.widget/test.list"

refreshFrequency: 30000

render: -> """
	<div>
  	<table></table>
	</div>
"""

update: (output, domEl) ->
	urls 	= output.split("\n")
	table = $(domEl).find('table')

	table.html('')

	renderUrl = (name, status) -> """
		<tr class="row">
			<td class="url">#{ name }</td>
			<td class="#{ status }">#{ status }</td>
		</tr>
	"""

	for line in urls
		[url, status] = line.split('|')
		if url.length > 0
			table.append renderUrl(url, status)
