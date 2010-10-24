<g:if test="${evento.inscricoes}">
<table>
	<thead>
	<tr>

		<th>ID</th>
		<th>Data</th>
		<th>Nome</th>
		<th>Email</th>

	</tr>
	</thead>
	<tbody>
	<g:each in="${evento.inscricoes}" status="i" var="inscricao">
	<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

		<td>${inscricao.id}</td>
		<td>${inscricao.dataInscricao}</td>
		<td>${inscricao.participante.nome}</td>
		<td>${inscricao.participante.email}</td>

	</tr>
	</g:each>
	</tbody>
</table>
</g:if>
<g:else>
Nenhuma inscrição encontrada
</g:else>