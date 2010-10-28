package jmeetings

class ParticipanteService {

	static transactional = false

	def validarCPF(Participante participante) {


		def CNPJ_CPF = participante.cpf

		if (CNPJ_CPF.length() == 11) { //CPF
			int acumulador1 = 0;
			int acumulador2 = 0;
			int resto = 0;
			StringBuffer resultado = new StringBuffer();
			String digitoVerificadorCPF = CNPJ_CPF.substring((CNPJ_CPF.length() - 2),
															CNPJ_CPF.length());
			for (int i = 1; i < (CNPJ_CPF.length() - 1); i++) {
				acumulador1 += (11 - i) * Integer.valueOf(CNPJ_CPF.substring((i - 1), i));
				acumulador2 += (12 - i) * Integer.valueOf(CNPJ_CPF.substring((i - 1), i));
			}
			resto = acumulador1 % 11;
			if (resto < 2) {
				acumulador2 += 2;
				resultado.append(2);
			} else {
				acumulador2 += 2 * (11 - resto);
				resultado.append((11 - resto));
			}
			resto = acumulador2 % 11;
			if (resto < 2) {
				resultado.append(0);
			} else {
				resultado.append((11 - resto));
			}
			return resultado.toString().equals(digitoVerificadorCPF);
		} else if (CNPJ_CPF.length() == 14) { //CNPJ
			int acumulador = 0;
			int digito = 0;
			StringBuffer CNPJ = new StringBuffer();
			char[] CNPJCharArray = CNPJ_CPF.toCharArray();
			CNPJ.append(CNPJ_CPF.substring(0, 12));
			for (int i = 0; i < 4; i++) {
				if (((CNPJCharArray[i] - 48) >= 0)
					&& ((CNPJCharArray[i] - 48) <= 9)) {
					acumulador += (CNPJCharArray[i] - 48) * (6 - (i + 1));
					}
			}
			for (int i = 0; i < 8; i++) {
				if (((CNPJCharArray[i + 4] - 48) >= 0)
					&& ((CNPJCharArray[i + 4] - 48) <= 9)) {
					acumulador += (CNPJCharArray[i + 4] - 48) * (10 - (i + 1));
					}
			}
			digito = 11 - (acumulador % 11);
			CNPJ.append((digito == 10 || digito == 11) ? "0" : digito);
			acumulador = 0;
			for (int i = 0; i < 5; i++) {
				if (((CNPJCharArray[i] - 48) >= 0)
					&& ((CNPJCharArray[i] - 48) <= 9)) {
					acumulador += (CNPJCharArray[i] - 48) * (7 - (i + 1));
					}
			}
			for (int i = 0; i < 8; i++) {
				if (((CNPJCharArray[i + 5] - 48) >= 0) && ((CNPJCharArray[i + 5] - 48) <= 9)) {
						acumulador += (CNPJCharArray[i + 5] - 48) * (10 - (i + 1));
				}
			}
			digito = 11 - (acumulador % 11);
			CNPJ.append((digito == 10 || digito == 11) ? "0" : digito);
			return CNPJ.toString().equals(CNPJ_CPF);
		}


		return false


	}
}
