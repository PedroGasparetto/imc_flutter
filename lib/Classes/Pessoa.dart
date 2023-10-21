class IMC {
  double peso;
  double altura;
  String classificacao = 'Não disponível';

  IMC({required this.peso, required this.altura}) {
    double imc = peso / (altura * altura);
    if (imc < 16) {
      classificacao = 'Magreza Grave';
    } else if (imc < 17) {
      classificacao = 'Magreza Moderada';
    } else if (imc < 18.5) {
      classificacao = 'Magreza Leve';
    } else if (imc < 25) {
      classificacao = 'Saudável';
    } else if (imc < 30) {
      classificacao = 'Sobrepeso';
    } else if (imc < 35) {
      classificacao = 'Obesidade Grau I';
    } else if (imc < 40) {
      classificacao = 'Obesidade Grau II (Severa)';
    } else {
      classificacao = 'Obesidade Grau III (Mórbida)';
    }
  }
}
