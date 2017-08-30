package sobreavisonutel

import sobreavisonutel.Atendentes

class Ocorrencias {

    Date data //data da escala
    Date horaInicio
    Date horaFim
    Date dataModificacao //data da modificação para fins de log
    String atendentes //atendente no dia
    String resumido
    String detalhado
    String login //Login de quem alterou a escala

    static constraints = {

        data nullable: false
        atendentes nullable: false
        horaInicio nullable: false
        horaFim nullable: false
        dataModificacao nullable: false
        resumido nullable: false
        detalhado nullable: true
        login nullable: false
    }
}